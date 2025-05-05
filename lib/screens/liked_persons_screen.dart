import 'package:flutter/material.dart';
import 'package:lab52/widgets/person_short_card.dart';
import 'package:provider/provider.dart';
import '../app_routes.dart';
import '../models/person.dart';
import '../provider/person_list_provider.dart';

class LikedPersonsScreen extends StatefulWidget {
  const LikedPersonsScreen({super.key});

  @override
  State<LikedPersonsScreen> createState() => _LikedPersonsScreenState();
}

class _LikedPersonsScreenState extends State<LikedPersonsScreen> {
  void goToChat() {
    Navigator.of(context).pushNamed(AppRoutes.chat);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Person> likedPersons =
        context
            .watch<PersonListProvider>()
            .persons
            .where((e) => e.isLiked == true)
            .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Start chatting now!'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          likedPersons.isNotEmpty
              ? Expanded(
                child: ListView.builder(
                  itemBuilder:
                      (ctx, index) => PersonShortCard(
                        openChat: goToChat,
                        changeCondition: () {},
                        deletePerson: () {},
                        person: likedPersons[index],
                      ),
                  itemCount: likedPersons.length,
                ),
              )
              : Center(
                child: Text(
                  'You have not liked anyone yet',
                  style: theme.textTheme.headlineSmall,
                ),
              ),
        ],
      ),
    );
  }
}
