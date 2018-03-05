import 'package:flutter/material.dart';
import 'package:flutterwords/repository/word_repository.dart';
import 'package:flutterwords/module/words/words_views.dart';
import 'package:flutterwords/router.dart';

class WordsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WordsPageState(new WordRepository());
  }
}

class WordsPageState extends State<WordsPage> {
  final _suggestions = <String>[];
  WordRepository wordRepository;

  WordsPageState(this.wordRepository);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Random Words"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushSaved,
          )
        ],
      ),
      body: new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(wordRepository.generateWords(10));
          }
          var wordPair = _suggestions[index];
          return _buildRow(wordPair);
        },
      ),
    );
  }

  void _pushSaved() {
    final savedWords = wordRepository.getSavedWords();
    Router.pushToSavedWords(context, savedWords);
  }

  Widget _buildRow(String word) {
    final isSaved = wordRepository.isSaved(word);
    return WordsViews.wordCell(word, isSaved, () {
      setState(() {
        if (isSaved) {
          wordRepository.unsave(word);
        } else {
          wordRepository.save(word);
        }
      });
    });
  }
}
