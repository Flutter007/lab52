import 'package:flutter/material.dart';
import 'package:lab52/widgets/profile_data_view.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../provider/user_provider.dart';
import '../widgets/registration_form/registration_form.dart';
import '../widgets/registration_form/registration_form_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User? user;
  final controller = RegistrationFormController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final user = context.watch<UserProvider>().user;
    if (user != null) {
      controller.setUser(user);
    }
  }

  void saveChanges() {
    if (controller.formKey.currentState!.validate()) {
      final user = controller.getUser(
        context.read<UserProvider>().selectedMeetGender!,
      );
      context.read<UserProvider>().setUser(user);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void openForm() {
    showModalBottomSheet(
      context: context,
      builder:
          (ctx) => SingleChildScrollView(
            child: Column(
              children: [
                RegistrationForm(
                  controller: controller,
                  firstMenu: Container(),
                  secondMenu: Container(),
                ),
                ElevatedButton(onPressed: saveChanges, child: Text('Save')),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your account Information'),
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: openForm, icon: Icon(Icons.edit))],
      ),
      body: Center(child: ProfileDataView()),
    );
  }
}
