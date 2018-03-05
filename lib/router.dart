import 'package:flutterwords/module/words/words_views.dart';
import 'package:flutter/material.dart';

class Router {
  static void pushToSavedWords(BuildContext context, List<String> words) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return WordsViews.savedWordsPage(context, words);
        },
      ),
    );
  }
}