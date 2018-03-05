import 'package:english_words/english_words.dart';

class WordRepository {
  var _savedWords = <String>[];

  List<String> generateWords(int count) {
    var words = <String>[];
    for (var i = 0; i < count; i++) {
      words.add(new WordPair.random().asPascalCase);
    }
    return words;
  }

  List<String> getSavedWords() {
    return _savedWords;
  }

  bool isSaved(String word) {
    return _savedWords.contains(word);
  }

  void save(String word) {
    _savedWords.add(word);
  }

  void unsave(String word) {
    _savedWords.remove(word);
  }
}