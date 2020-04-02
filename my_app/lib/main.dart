import 'dart:convert';
import 'dart:io';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(WordScreen());

class AnimalListWidget extends StatefulWidget {
  @override
  AnimalListWidgetState createState() => AnimalListWidgetState();
}

class AnimalListWidgetState extends State<AnimalListWidget> {
  List<AnimalCard> _animals = [];

  @override
  void initState() {
    super.initState();
    loadStorage();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _animals.map((animal) => animalRow(animal, _animals.indexOf(animal))).toList(),
    );
  }

  void loadStorage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      List<dynamic> animals = json.decode(prefs.getString('animals'));
      _animals = animals.map((animal) => new AnimalCard(animal['name'], animal['favorite'])).toList();
    });
  }

  Container animalRow(AnimalCard animal, int index) {
    return Container(
      child: Center(
        child: ListTile(
          title: Text(animal.label()),
          trailing: IconButton(icon: Icon(Icons.star), key: Key("list-icon-" + index.toString())),
          onTap: () {
            setState(() {
              animal.favorite = !animal.favorite;
              updateAnimal();
            });
          },
        ),
      ),
    );
  }

  void updateAnimal() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('animals', jsonEncode(_animals));
  }
}

class AnimalCard {
  String name;
  bool favorite;

  AnimalCard(String name, [favorite]) {
    this.name = name;
    this.favorite = favorite ?? false;
  }

  String label() {
    if (favorite) {
      return name + " tapped!";
    }
    return name;
  }

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'favorite': favorite,
      };
}

class WordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    setAnimals();
    return MaterialApp(
      title: "words list",
      home: Scaffold(body: AnimalListWidget()),
    );
  }

  void setAnimalsForDebug() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('animals', jsonEncode([new AnimalCard('Dog'), new AnimalCard('Cat')]));
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: RandomWordsWidget(),
        ),
      ),
    );
  }
}

class RandomWordsWidget extends StatefulWidget {
  @override
  RandomWordsWidgetState createState() => RandomWordsWidgetState();
}

class RandomWordsWidgetState extends State<RandomWordsWidget> {
  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18.0),
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: TextStyle(fontSize: 18.0),
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
