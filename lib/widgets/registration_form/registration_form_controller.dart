import 'package:flutter/cupertino.dart';
import 'package:lab52/models/user.dart';

class RegistrationFormController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final imageController = TextEditingController();
  final locationController = TextEditingController();

  void dispose() {
    nameController.dispose();
    ageController.dispose();
    imageController.dispose();
    lastNameController.dispose();
    locationController.dispose();
  }

  void setUser(User user) {
    nameController.text = user.name;
    ageController.text = user.age.toString();
    imageController.text = user.image;
    lastNameController.text = user.lastName;
    locationController.text = user.gender;
  }

  User getUser(String gender) {
    return User(
      gender: gender,
      name: nameController.text,
      lastName: lastNameController.text,
      age: int.parse(ageController.text),
      image: imageController.text,
      location: locationController.text,
    );
  }
}
