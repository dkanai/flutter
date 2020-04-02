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
          title: Text(animal.name, style: TextStyle(fontSize: 20)),
          trailing: IconButton(icon: icon(), key: Key("list-icon-" + index.toString())),
          onTap: () {
            onTap(animal);
          },
        ),
      ),
    );
  }

  Icon icon() => animal.favorite ? Icon(Icons.star, color: Colors.yellowAccent) : Icon(Icons.star_border);
}
