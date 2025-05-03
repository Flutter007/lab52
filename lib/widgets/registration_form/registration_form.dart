import 'package:flutter/material.dart';
import 'package:lab52/widgets/registration_form/registration_form_controller.dart';

import '../custom_text_form_field.dart';

class RegistrationForm extends StatefulWidget {
  final RegistrationFormController controller;
  const RegistrationForm({super.key, required this.controller});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String? userGender;
  String? userMeetingGender;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.controller.formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
              controller: widget.controller.nameController,
              labelText: 'First Name',
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                } else if (value.length < 3) {
                  return 'Your name is too short';
                }
                return null;
              },
            ),
            CustomTextFormField(
              controller: widget.controller.lastNameController,
              labelText: 'Last name',
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
            CustomTextFormField(
              controller: widget.controller.ageController,
              keyboardType: TextInputType.number,
              labelText: 'Age',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age name';
                } else if (int.parse(value) < 18) {
                  return 'You are not old enough';
                }
                return null;
              },
            ),
            CustomTextFormField(
              controller: widget.controller.imageController,
              keyboardType: TextInputType.url,
              labelText: 'Image',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your image ';
                }
                return null;
              },
            ),
            CustomTextFormField(
              controller: widget.controller.locationController,
              labelText: 'Location (City and Country)',
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your location ';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
