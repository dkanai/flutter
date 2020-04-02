import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'animal.dart';

class AnimalListWidget extends StatefulWidget {
  @override
  AnimalListWidgetState createState() => AnimalListWidgetState();
}

class AnimalListWidgetState extends State<AnimalListWidget> {
  List<Animal> _animals = [];

  @override
  void initState() {
    super.initState();
    loadStorage();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _animals.map((animal) => animalRow(animal, _animals.indexOf(animal))).toList(),
    );
  }

  void loadStorage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      List<dynamic> animals = json.decode(prefs.getString('animals'));
      _animals = animals.map((animal) => new Animal(animal['name'], animal['favorite'])).toList();
    });
  }

  Container animalRow(Animal animal, int index) {
    return Container(
      child: Center(
        child: ListTile(
          title: Text(animal.label()),
          trailing: IconButton(icon: Icon(Icons.star), key: Key("list-icon-" + index.toString())),
          onTap: () {
            setState(() {
              animal.favorite = !animal.favorite;
              updateAnimal();
            });
          },
        ),
      ),
    );
  }

  void updateAnimal() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('animals', jsonEncode(_animals));
  }
}
