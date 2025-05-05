import 'package:flutter/material.dart';
import '../models/person.dart';

class PersonFindCard extends StatelessWidget {
  final Person person;
  const PersonFindCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 300,
      child: Card(
        child: Column(
          children: [
            Image.network(person.image, fit: BoxFit.fill),
            Text('${person.name} ${person.lastName}'),
            Text(person.age.toString()),
            Text('${person.city}, ${person.country}'),
          ],
        ),
      ),
    );
  }
}
