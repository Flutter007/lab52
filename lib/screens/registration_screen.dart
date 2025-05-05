import 'package:flutter/material.dart';
import 'package:lab52/app_routes.dart';
import 'package:provider/provider.dart';
import '../data/registration_data.dart';
import '../provider/user_provider.dart';
import '../widgets/registration_form/registration_form.dart';
import '../widgets/registration_form/registration_form_controller.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? userMeetingGender;
  String? userGender;
  final controller = RegistrationFormController();

  void goToMain() {
    Navigator.of(context).pushNamed(AppRoutes.home, arguments: userGender);
  }

  void saveUser() {
    if (controller.formKey.currentState!.validate() &&
        userGender != null &&
        userMeetingGender != null) {
      final user = controller.getUser(userGender!);
      context.read<UserProvider>().setUser(user);
      context.read<UserProvider>().setGender(userMeetingGender);
      goToMain();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register yourself!')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegistrationForm(controller: controller),
            SizedBox(height: 20),
            DropdownMenu(
              expandedInsets: EdgeInsets.all(40),
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
            SizedBox(height: 20),
            DropdownMenu(
              expandedInsets: EdgeInsets.all(40),
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
            SizedBox(height: 40),
            ElevatedButton(onPressed: saveUser, child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
