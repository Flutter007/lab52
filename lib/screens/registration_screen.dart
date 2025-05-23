import 'package:flutter/material.dart';
import 'package:lab52/app_routes.dart';
import 'package:lab52/widgets/gender_dropdown_menu.dart';
import 'package:provider/provider.dart';
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
    Navigator.of(context).pushNamed(AppRoutes.home);
  }

  void saveUser() {
    if (controller.formKey.currentState!.validate() &&
        userGender != null &&
        userMeetingGender != null) {
      final user = controller.getUser(userGender!);
      context.read<UserProvider>().setUser(user);
      context.read<UserProvider>().setGender(userMeetingGender, userGender);
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
            RegistrationForm(
              firstMenu: GenderDropDownMenu(
                txt: 'Gender',
                icon: Icon(userGender == 'male' ? Icons.male : Icons.female),
                onSelected: (value) {
                  setState(() {
                    userGender = value;
                  });
                },
              ),
              controller: controller,
              secondMenu: GenderDropDownMenu(
                txt: 'Meeting Gender',
                icon: Icon(
                  userMeetingGender == 'male' ? Icons.male : Icons.female,
                ),
                onSelected: (value) {
                  setState(() {
                    userMeetingGender = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: saveUser, child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
