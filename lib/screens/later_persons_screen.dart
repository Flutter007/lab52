import 'package:flutter/material.dart';
import 'package:lab52/widgets/person_short_card.dart';
import 'package:provider/provider.dart';
import 'package:lab52/models/person.dart';
import '../provider/person_list_provider.dart';

class LaterPersonsScreen extends StatefulWidget {
  const LaterPersonsScreen({super.key});

  @override
  State<LaterPersonsScreen> createState() => _LaterPersonsScreenState();
}

class _LaterPersonsScreenState extends State<LaterPersonsScreen> {
  void changeCondition(Person person) {
    context.read<PersonListProvider>().goToFav(person);
  }

  void deletePerson(Person person) {
    context.read<PersonListProvider>().deletePerson(person);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Person> latePersons =
        context
            .watch<PersonListProvider>()
            .persons
            .where((e) => e.isLiked == false)
            .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Like them too!'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          latePersons.isNotEmpty
              ? Expanded(
                child: ListView.builder(
                  itemBuilder:
                      (ctx, index) => PersonShortCard(
                        openChat: () {},
                        changeCondition:
                            () => changeCondition(latePersons[index]),
                        deletePerson: () => deletePerson(latePersons[index]),
                        person: latePersons[index],
                      ),
                  itemCount: latePersons.length,
                ),
              )
              : Center(
                child: Text(
                  'There are nobody)',
                  style: theme.textTheme.headlineSmall,
                ),
              ),
        ],
      ),
    );
  }
}
