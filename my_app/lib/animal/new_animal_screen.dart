import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animal_form.dart';

class NewAnimalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("New Animal"),
        ),
        body: AnimalForm());
  }
}
