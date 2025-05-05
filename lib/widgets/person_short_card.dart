import 'package:flutter/material.dart';
import '../models/person.dart';

class PersonShortCard extends StatelessWidget {
  final void Function() onTap;
  final Person person;
  const PersonShortCard({super.key, required this.onTap, required this.person});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      trailing: Container(
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
      title: Text(person.name),
      subtitle: Text(person.lastName),
    );
  }
}
