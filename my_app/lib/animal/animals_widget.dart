import 'package:flutter/material.dart';

import 'animal.dart';
import 'animal_repository.dart';
import 'animal_widget.dart';

class AnimalsWidget extends StatefulWidget {
  @override
  AnimalsWidgetState createState() => AnimalsWidgetState();
}

class AnimalsWidgetState extends State<AnimalsWidget> {
  List<Animal> _animals = [];
  AnimalRepository animalRepository = new AnimalRepository();


  @override
  void initState() {
    super.initState();
    loadAnimal();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _animals.map((animal) => AnimalWidget(animal: animal, index: _animals.indexOf(animal), onTap: onTapFavorite)).toList(),
    );
  }

  void onTapFavorite(Animal animal) {
    setState(() {
      animal.favorite = !animal.favorite;
      animalRepository.update(_animals);
    });
  }

  void loadAnimal() async {
    List<Animal> animals = await animalRepository.load();
    setState(() {
      _animals = animals;
    });
  }
}
