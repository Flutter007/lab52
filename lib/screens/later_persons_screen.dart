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

  @override
  Widget build(BuildContext context) {
    final List<Person> latePersons =
        context
            .watch<PersonListProvider>()
            .persons
            .where((e) => e.isLiked == false)
            .toList();
    return Scaffold(
      appBar: AppBar(title: Text('Later'), automaticallyImplyLeading: false),
      body: Column(
        children: [
          latePersons.isNotEmpty
              ? Expanded(
                child: ListView.builder(
                  itemBuilder:
                      (ctx, index) => PersonShortCard(
                        onTap: () {},
                        person: latePersons[index],
                      ),
                  itemCount: latePersons.length,
                ),
              )
              : Center(child: Text('No persons')),
        ],
      ),
    );
  }
}
