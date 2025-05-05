import 'package:flutter/material.dart';

import '../models/person.dart';

class PersonListProvider extends ChangeNotifier {
  List<Person> _persons = [];

  List<Person> get persons => _persons;

  void changeLiked(Person person) {
    final index = _persons.indexWhere((element) => element.uuid == person.uuid);
    if (index != -1) {
      _persons[index] = person.copyWith(isLiked: !person.isLiked);
    }
    notifyListeners();
  }

  void addPerson(Person person) {
    final index = _persons.indexWhere((element) => element.uuid == person.uuid);
    if (index != -1) {
      _persons[index] = person.copyWith(isLiked: true);
    } else {
      _persons = [..._persons, person.copyWith(isLiked: true)];
    }
    notifyListeners();
  }

  void goToLaterList(Person person) {
    final index = _persons.indexWhere((element) => element.uuid == person.uuid);
    if (index != -1) {
      _persons[index] = person.copyWith(isLiked: false);
    } else {
      _persons = [..._persons, person.copyWith(isLiked: false)];
    }
    notifyListeners();
  }

  void goToFav(Person person) {
    final index = _persons.indexWhere((element) => element.uuid == person.uuid);
    if (index != -1) {
      _persons[index] = person.copyWith(isLiked: true);
    } else {
      _persons = [..._persons, person.copyWith(isLiked: true)];
    }
    notifyListeners();
  }
}
