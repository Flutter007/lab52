import 'package:flutter/cupertino.dart';

import '../../models/person.dart';

class RegistrationFormController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final imageController = TextEditingController();

  void dispose() {
    nameController.dispose();
    ageController.dispose();
    imageController.dispose();
  }

  void setPerson(Person person) {
    nameController.text = person.name;
    ageController.text = person.age.toString();
    imageController.text = person.image;
  }
}
