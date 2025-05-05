import 'package:flutter/material.dart';
import '../models/person.dart';
import 'custom_text.dart';
import 'image_container.dart';

class PersonFindCard extends StatelessWidget {
  final Person person;
  const PersonFindCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 320,
      child: Card(
        child: Column(
          children: [
            SizedBox(height: 20),
            ImageContainer(image: person.image),
            SizedBox(height: 8),
            CustomText(
              txt: '${person.name} ${person.lastName} , ${person.age}',
            ),
            CustomText(txt: '${person.city}, ${person.country}'),
          ],
        ),
      ),
    );
  }
}
