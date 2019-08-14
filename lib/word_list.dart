import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_package/flutter_widget_compat.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return Material(child:
      ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
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
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompatScaffold(
      appBar: CompatAppBar(
        title: Text('Startup Name Generator'),
        trailingActions: [
          CompatIconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      compatPageRoute<void>(builder: (BuildContext context) {
        final Iterable<Widget> tiles = _saved.map(
              (WordPair pair) {
            return Material(child:
              ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              )
            );
          },
        );
        final List<Widget> divided = ListTile
            .divideTiles(
          context: context,
          tiles: tiles,
        ).toList();

        return new CompatScaffold(
          appBar:  CompatAppBar(
            title: const Text('Saved Suggestions'),
          ),
          body: ListView(children: divided),
        );
      })
    );
  }
}