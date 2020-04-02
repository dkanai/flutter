import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(AnimalListScreen());

class AnimalListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    setAnimals();
    return MaterialApp(
      title: "words list",
      home: Scaffold(body: AnimalListWidget()),
    );
  }

  void setAnimalsForDebug() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('animals', jsonEncode([new AnimalCard('Dog'), new AnimalCard('Cat')]));
  }
}

class AnimalListWidget extends StatefulWidget {
  @override
  AnimalListWidgetState createState() => AnimalListWidgetState();
}

class AnimalListWidgetState extends State<AnimalListWidget> {
  List<AnimalCard> _animals = [];

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
      _animals = animals.map((animal) => new AnimalCard(animal['name'], animal['favorite'])).toList();
    });
  }

  Container animalRow(AnimalCard animal, int index) {
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

class AnimalCard {
  String name;
  bool favorite;

  AnimalCard(String name, [favorite]) {
    this.name = name;
    this.favorite = favorite ?? false;
  }

  String label() {
    if (favorite) {
      return name + " tapped!";
    }
    return name;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'favorite': favorite,
      };
}
