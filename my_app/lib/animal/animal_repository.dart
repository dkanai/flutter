import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'animal.dart';

class AnimalRepository {
  var key = 'animals';

  void update(List<Animal> animals) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(animals));
  }

  Future<List> load() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key) == false) {
      List<Animal> empty = [];
      return empty;
    }
    List<dynamic> animals = json.decode(prefs.getString(key));
    return animals.map((animal) => new Animal(animal['name'], animal['favorite'])).toList();
  }

  void add(Animal animal) async {
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> animals = json.decode(prefs.getString(key));
    animals.add(animal);
    prefs.setString(key, jsonEncode(animals));
  }
}
