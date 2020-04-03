import 'package:flutter/material.dart';

import '../animal.dart';
import '../animal_repository.dart';
import 'animal_widget.dart';

class AnimalsWidget extends StatefulWidget {
  AnimalRepository animalRepository;

  AnimalsWidget(this.animalRepository);

  @override
  AnimalsWidgetState createState() => AnimalsWidgetState(animalRepository);
}

class AnimalsWidgetState extends State<AnimalsWidget> {
  List<Animal> _animals = [];
  AnimalRepository animalRepository;

  AnimalsWidgetState(this.animalRepository);

  @override
  void initState() {
    super.initState();
    loadAnimal();
  }

  @override
  Widget build(BuildContext context) {
    if (_animals.length == 0) {
      return Text("There is no animal", key: Key('animals-widget'));
    }
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
