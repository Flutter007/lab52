import 'package:flutter/material.dart';
import 'package:lab52/models/person.dart';
import 'package:lab52/provider/person_liked_provider.dart';
import 'package:lab52/widgets/person_find_card.dart';
import 'package:provider/provider.dart';

import '../helpers/requets.dart';

class FindPersonScreen extends StatefulWidget {
  final String? userGender;
  const FindPersonScreen({super.key, this.userGender});

  @override
  State<FindPersonScreen> createState() => _FindPersonScreenState();
}

class _FindPersonScreenState extends State<FindPersonScreen> {
  bool isLoading = false;
  String? error;
  late String? userGender;
  Person? person;

  void fetchPerson() async {
    setState(() {
      isLoading = true;
      error = null;
    });
    try {
      Map<String, dynamic> personInfo = await request(
        'https://randomuser.me/api/',
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userGender = ModalRoute.of(context)!.settings.arguments as String?;
    fetchPerson();
  }

  void likePerson(Person person) {
    context.read<PersonLiked>().addPerson(person);
    fetchPerson();
  }

  @override
  Widget build(BuildContext context) {
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
            ElevatedButton(
              onPressed: () => likePerson(person!),
              child: Text('Like'),
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
