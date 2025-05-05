import 'package:flutter/material.dart';
import '../models/person.dart';

class PersonShortCard extends StatelessWidget {
  final void Function() openChat;
  final void Function() changeCondition;
  final void Function() deletePerson;
  final Person person;
  const PersonShortCard({
    super.key,
    required this.openChat,
    required this.person,
    required this.changeCondition,
    required this.deletePerson,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: person.isLiked == true ? openChat : null,
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(person.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      trailing:
          (person.isLiked == false)
              ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: deletePerson, icon: Icon(Icons.delete)),
                  IconButton(
                    onPressed: changeCondition,
                    icon: Icon(Icons.favorite),
                  ),
                ],
              )
              : null,
      title: Text(person.name),
      subtitle: Text(person.lastName),
    );
  }
}
