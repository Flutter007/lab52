import 'package:flutter/material.dart';

import '../models/person.dart';

class PersonLiked extends ChangeNotifier {
  List<Person> _persons = [];

  List<Person> get persons => _persons;

  void addPerson(Person person) {
    _persons = [..._persons, person];
    notifyListeners();
  }
}
