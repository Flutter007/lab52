import 'package:flutter/material.dart';

class LeftMassage extends StatelessWidget {
  final String txt;
  const LeftMassage(this.txt, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 10),
          child: Container(
            width: 225,
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(textAlign: TextAlign.left, txt),
            ),
          ),
        ),
      ],
    );
  }
}
