import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'animal.dart';
import 'animal_repository.dart';

class AnimalForm extends StatefulWidget {
  @override
  AnimalFormState createState() {
    return AnimalFormState();
  }
}

class AnimalFormState extends State<AnimalForm> {
  AnimalRepository animalRepository = new AnimalRepository();
  final _formKey = GlobalKey<FormState>();
  bool _favorite = false;
  String _name = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          nameField(),
          favoriteCheckBox(),
          submitButton(context),
        ],
      ),
    );
  }

  Padding submitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        onPressed: () {
          onPressSubmit(context);
        },
        child: Text('Submit'),
      ),
    );
  }

  Checkbox favoriteCheckBox() {
    return Checkbox(
        value: _favorite,
        onChanged: (newValue) {
          setState(() {
            _favorite = newValue;
          });
        });
  }

  void onPressSubmit(BuildContext context) {
    if (_formKey.currentState.validate() == false) return;
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Success')));
    animalRepository.add(new Animal(_name, _favorite));
  }

  TextFormField nameField() {
    return TextFormField(
      onChanged: (text) {
        setState(() {
          _name = text;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
