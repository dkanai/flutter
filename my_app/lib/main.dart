import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'animal/animal.dart';
import 'animal/animal_list_widget.dart';

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
    prefs.setString('animals', jsonEncode([new Animal('Dog'), new Animal('Cat')]));
  }
}



