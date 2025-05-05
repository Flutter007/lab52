import 'package:flutter/material.dart';
import 'message.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Message(
          txt: 'Привет, хочу познакомиться)',
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        Message(txt: 'Привет,давай)', mainAxisAlignment: MainAxisAlignment.end),
        Message(
          txt: 'С чего начнем?',
          mainAxisAlignment: MainAxisAlignment.end,
        ),
      ],
    );
  }
}
