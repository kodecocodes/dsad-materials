// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/trie.dart';
import 'package:test/test.dart';

void main() {
  group('Trie:', () {
    test('non-null root', () {
      final trie = Trie<int, List<int>>();
      expect(trie.root, isNotNull);
    });

    test('insert and contains', () {
      final trie = Trie<int, List<int>>();
      trie.insert('cute'.codeUnits);
      expect(trie.contains('cute'.codeUnits), true);
      expect(trie.contains('cut'.codeUnits), false);
      trie.insert('cut'.codeUnits);
      expect(trie.contains('cute'.codeUnits), true);
      expect(trie.contains('cut'.codeUnits), true);
    });

    test('remove', () {
      final trie = Trie<int, List<int>>();
      expect(() => trie.remove('cut'.codeUnits), returnsNormally);
      trie.insert('cut'.codeUnits);
      expect(trie.contains('cut'.codeUnits), true);
      trie.remove('cut'.codeUnits);
      expect(trie.contains('cut'.codeUnits), false);
    });

    test('matchPrefix', () {
      final trie = Trie<int, List<int>>();
      trie.insert('cute'.codeUnits);
      trie.insert('cut'.codeUnits);
      expect(trie.matchPrefix('cu'.codeUnits),
          ['cut'.codeUnits, 'cute'.codeUnits]);
      expect(trie.matchPrefix('cute'.codeUnits), ['cute'.codeUnits]);
    });
  });
}
