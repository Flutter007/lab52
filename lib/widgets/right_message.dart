import 'package:flutter/material.dart';

class RightMassage extends StatelessWidget {
  final String txt;
  const RightMassage(this.txt, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Container(
            width: 200,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(textAlign: TextAlign.left, txt),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
