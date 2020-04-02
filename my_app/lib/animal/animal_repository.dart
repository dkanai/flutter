import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'animal.dart';

class AnimalRepository {

  void update(List<Animal> animals) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('animals', jsonEncode(animals));
  }

  Future<List> load() async {
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> animals = json.decode(prefs.getString('animals'));
    return animals.map((animal) => new Animal(animal['name'], animal['favorite'])).toList();
  }
}
