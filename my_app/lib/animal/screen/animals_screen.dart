import 'package:flutter/material.dart';
import 'package:my_app/animal/animal_repository.dart';
import 'package:my_app/animal/screen/new_animal_screen.dart';

import '../widget/animals_widget.dart';

class AnimalsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animals',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animals'),
        ),
        body: AnimalsWidget(new AnimalRepository()),
        floatingActionButton: floatingActionButton(context),
      ),
    );
  }

  FloatingActionButton floatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
      key: Key('new_animal_button'),
      label: Text('New Animal'),
      icon: Icon(Icons.add),
      backgroundColor: Colors.pink,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewAnimalScreen()),
        );
      },
    );
  }
}
