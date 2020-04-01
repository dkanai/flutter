import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(WordScreen());

class AnimalListWidget extends StatefulWidget {
  @override
  AnimalListWidgetState createState() => AnimalListWidgetState();
}

class AnimalListWidgetState extends State<AnimalListWidget> {
  final _animals = ['Dog', 'Cat'];
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _animals
          .map((animal) => animalRow(animal, _animals.indexOf(animal)))
          .toList(),
    );
  }

  Container animalRow(String animal, int index) {
    String isTappedLabel = "";
    if (_isTapped) {
      isTappedLabel = " tapped!";
    }
    return Container(
      child: Center(
        child: ListTile(
          title: Text(animal + isTappedLabel),
          trailing: IconButton(
              icon: Icon(Icons.star),
              key: Key("list-icon-" + index.toString())),
          onTap: () {
            setState(() {
              _isTapped = true;
            });
          },
        ),
      ),
    );
  }
}

class WordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "words list",
      home: Scaffold(body: AnimalListWidget()),
    );
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
