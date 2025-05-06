import 'package:flutter/material.dart';
import 'package:lab52/models/person.dart';
import 'package:lab52/provider/person_list_provider.dart';
import 'package:lab52/provider/user_provider.dart';
import 'package:lab52/widgets/person_find_card.dart';
import 'package:provider/provider.dart';
import '../helpers/request.dart';
import '../theme/color.dart';
import '../widgets/custom_icon.dart';

class FindPersonScreen extends StatefulWidget {
  const FindPersonScreen({super.key});

  @override
  State<FindPersonScreen> createState() => _FindPersonScreenState();
}

class _FindPersonScreenState extends State<FindPersonScreen> {
  bool isLoading = false;
  String? error;
  late String? userSelectedGender;
  Person? person;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userSelectedGender = context.read<UserProvider>().selectedGender;
    fetchPerson();
  }

  void fetchPerson() async {
    setState(() {
      isLoading = true;
      error = null;
    });
    try {
      Map<String, dynamic> personInfo = await request(
        userSelectedGender == 'male'
            ? 'https://randomuser.me/api/?gender=male'
            : 'https://randomuser.me/api/?gender=female',
      );
      final personData = personInfo['results'];
      setState(() {
        person = Person.fromJson(personData[0]);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  void likePerson(Person person) {
    if (person.isLiked == false) {
      context.read<PersonListProvider>().changeLiked(person);
      context.read<PersonListProvider>().addPerson(person);
      fetchPerson();
    } else {
      fetchPerson();
    }
  }

  void postponePerson(Person person) {
    context.read<PersonListProvider>().goToLaterList(person);
    fetchPerson();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColor = theme.extension<CustomColor>()!;
    Widget content;
    if (isLoading) {
      content = Center(child: CircularProgressIndicator());
    } else if (error != null) {
      content = Center(child: Text(error!));
    } else {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PersonFindCard(person: person!),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => postponePerson(person!),
                  child: CustomIcon(
                    icon: Icons.watch_later_rounded,
                    color: customColor.txtColor,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => likePerson(person!),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        person!.isLiked == true
                            ? theme.colorScheme.inverseSurface
                            : theme.colorScheme.onPrimaryContainer,
                  ),
                  child: CustomIcon(
                    icon: Icons.favorite_rounded,
                    color: customColor.redShade,
                  ),
                ),
                ElevatedButton(
                  onPressed: fetchPerson,
                  child: CustomIcon(
                    icon: Icons.next_plan,
                    color: customColor.txtColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Lets Meet App'),
        automaticallyImplyLeading: false,
      ),
      body: content,
    );
  }
}
