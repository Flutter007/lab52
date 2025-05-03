import 'package:flutter/material.dart';

import '../data/registration_data.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? userGender;
  String? userMeetingGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register yourself!')),
      body: Center(
        child: Column(
          children: [
            DropdownMenu(
              expandedInsets: EdgeInsets.all(100),
              label: Text('Select Gender'),
              onSelected: (value) {
                setState(() {
                  userGender = value;
                });
              },
              dropdownMenuEntries:
                  genderList
                      .map(
                        (e) => DropdownMenuEntry(
                          value: e.id,
                          leadingIcon: Icon(e.icon),
                          label: e.title,
                        ),
                      )
                      .toList(),
            ),
            SizedBox(height: 100),
            DropdownMenu(
              expandedInsets: EdgeInsets.all(100),
              label: Text('Select preferred to meet gender'),
              onSelected: (value) {
                setState(() {
                  userMeetingGender = value;
                });
              },
              dropdownMenuEntries:
                  genderList
                      .map(
                        (e) => DropdownMenuEntry(
                          value: e.id,
                          leadingIcon: Icon(e.icon),
                          label: e.title,
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
