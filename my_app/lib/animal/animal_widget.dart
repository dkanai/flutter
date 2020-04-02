import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'animal.dart';

class AnimalWidget extends StatelessWidget {
  AnimalWidget({Key key, this.animal, this.index, this.onTap}) : super(key: key);

  final Animal animal;
  final int index;
  final void Function(Animal animal) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListTile(
          title: Text(animal.label()),
          trailing: IconButton(icon: Icon(Icons.star), key: Key("list-icon-" + index.toString())),
          onTap: () {
            onTap(animal);
          },
        ),
      ),
    );
  }
}
