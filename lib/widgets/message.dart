import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final String txt;
  const Message({
    super.key,
    required this.txt,
    required this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 10),
          child: Container(
            width: 190,
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: theme.colorScheme.primaryContainer,
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(textAlign: TextAlign.left, txt),
            ),
          ),
        ),
      ],
    );
  }
}
