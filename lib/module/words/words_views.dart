import 'package:flutter/material.dart';

class WordsViews {

  static ListTile wordCell(String word, bool isSaved, void onTap()) {
    return new ListTile(
      title: new Text(
        word,
        style: new TextStyle(fontSize: 18.0),
      ),
      trailing: new Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null,
      ),
      onTap: onTap,
    );
  }

  static Scaffold savedWordsPage(BuildContext context, List<String> words) {
    final tiles = words.map((word) {
      return WordsViews.wordCell(word, true, () {});
    });
    final dividedTiles = ListTile
        .divideTiles(
          context: context,
          tiles: tiles,
        )
        .toList();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Saved"),
      ),
      body: new ListView(children: dividedTiles),
    );
  }
}
