import 'package:flutter/material.dart';
import '../models/person.dart';
import '../theme/color.dart';
import 'custom_text.dart';

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
    final theme = Theme.of(context);
    final customColor = theme.extension<CustomColor>()!;
    return Card(
      child: ListTile(
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
                    IconButton(
                      onPressed: deletePerson,
                      icon: Icon(Icons.delete),
                      color: customColor.txtColor,
                    ),
                    IconButton(
                      onPressed: changeCondition,
                      icon: Icon(Icons.favorite),
                      color: customColor.txtColor,
                    ),
                  ],
                )
                : null,
        title: CustomText(txt: person.name),
        subtitle: CustomText(txt: person.lastName),
      ),
    );
  }
}
