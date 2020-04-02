import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'animal.dart';

class AnimalsWidget extends StatefulWidget {
  @override
  AnimalsWidgetState createState() => AnimalsWidgetState();
}

class AnimalsWidgetState extends State<AnimalsWidget> {
  List<Animal> _animals = [];

  @override
  void initState() {
    super.initState();
    loadStorage();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _animals.map((animal) => AnimalWidget(animal: animal, index: _animals.indexOf(animal), onTap: onTap)).toList(),
    );
  }

  void onTap(Animal animal) {
    setState(() {
      animal.favorite = !animal.favorite;
      updateAnimal();
    });
  }

  void loadStorage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      List<dynamic> animals = json.decode(prefs.getString('animals'));
      _animals = animals.map((animal) => new Animal(animal['name'], animal['favorite'])).toList();
    });
  }

  void updateAnimal() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('animals', jsonEncode(_animals));
  }
}

class AnimalWidget extends StatelessWidget {
  AnimalWidget({Key key, this.animal, this.index, this.onTap}) : super(key: key);

  final Animal animal;
  final int index;
  final void Function(Animal animal) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListTile(
          title: Text(animal.label()),
          trailing: IconButton(icon: Icon(Icons.star), key: Key("list-icon-" + index.toString())),
          onTap: () {
            onTap(animal);
          },
        ),
      ),
    );
  }
}
