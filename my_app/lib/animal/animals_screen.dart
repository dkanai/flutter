import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'animal.dart';
import 'animals_widget.dart';
import 'new_animal_screen.dart';

class AnimalsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    setAnimals();
    return MaterialApp(
      title: 'Animals',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animals'),
        ),
        body: AnimalsWidget(),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('New Animal'),
          icon: Icon(Icons.add),
          backgroundColor: Colors.pink,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NewAnimalScreen();
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void setAnimalsForDebug() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('animals', jsonEncode([new Animal('Dog'), new Animal('Cat')]));
  }
}
