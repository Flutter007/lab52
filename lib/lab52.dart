import 'package:flutter/material.dart';
import 'package:lab52/screens/registration_screen.dart';

class Lab52 extends StatefulWidget {
  const Lab52({super.key});

  @override
  State<Lab52> createState() => _Lab52State();
}

class _Lab52State extends State<Lab52> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RegistrationScreen());
  }
}
