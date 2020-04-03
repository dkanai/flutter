import 'package:flutter/material.dart';

import 'animal/screen/animals_screen.dart';

void main() => runApp(AnimalApp());

class AnimalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: AnimalsScreen());
  }
}
