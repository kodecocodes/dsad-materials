// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

void main() {}

class EnglishDictionary {
  final List<String> words = [];

  List<String> lookup(String prefix) {
    return words.where((word) {
      return word.startsWith(prefix);
    }).toList();
  }
}
