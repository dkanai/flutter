import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimalForm extends StatefulWidget {
  @override
  AnimalFormState createState() {
    return AnimalFormState();
  }
}

class AnimalFormState extends State<AnimalForm> {
  final _formKey = GlobalKey<FormState>();
  bool _favorite = false;

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
  }

  TextFormField nameField() {
    return TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
