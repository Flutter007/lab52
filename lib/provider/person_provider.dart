import 'package:flutter/material.dart';

class Person extends ChangeNotifier {
  Person? _person;
  Person? get user => _person;
  void setUser(Person person) {
    _person = person;
    notifyListeners();
  }
}
