import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewAnimalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("New Animal"),
            ),
            body: Text("New")));
  }
}
