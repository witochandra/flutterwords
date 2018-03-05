import "package:test/test.dart";
import "package:flutterwords/repository/word_repository.dart";

void main() {
  WordRepository repository;
  setUp(() {
    repository = new WordRepository();
  });
  test("test generateWords", () {
    var result = repository.generateWords(10);
    expect(result.length, equals(10));
  });
  test("test save", () {
    const word = "hello";
    repository.save(word);

    var result = repository.getSavedWords();
    expect(result, contains(word));
    expect(result.length, 1);
    expect(repository.isSaved(word), true);
  });
  test("test unsave", () {
    const word = "hello";
    repository.save(word);

    repository.unsave(word);

    var result = repository.getSavedWords();
    expect(result.length, 0);
    expect(repository.isSaved(word), false);
  });
}