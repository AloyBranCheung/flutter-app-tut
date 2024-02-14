import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyAppState extends ChangeNotifier {
  var history = <WordPair>[];
  var favorites = <WordPair>[];
  GlobalKey? historyListKey;
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    print("list 1: ${animatedList}");
    animatedList?.insertItem(0);
    print("list 2: ${animatedList}");
    notifyListeners();
  }

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current;
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  void getFavorites() {
    print(favorites);
  }

  void removeFavourites(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}
