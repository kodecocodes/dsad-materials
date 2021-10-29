// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/string_trie.dart';
import 'package:final_project/trie.dart';
import 'package:final_project/trie_node.dart';
import 'package:test/test.dart';

void main() {
  group('TrieNode:', () {
    test('property default values', () {
      final node = TrieNode<int>();
      expect(node.parent, isNull);
      expect(node.children.isEmpty, true);
      expect(node.key, isNull);
      expect(node.isTerminating, false);
    });
  });

  group('StringTrie:', () {
    test('non-null root', () {
      final trie = StringTrie();
      expect(trie.root, isNotNull);
    });

    test('insert and contains', () {
      final trie = StringTrie();
      trie.insert('cute');
      expect(trie.contains('cute'), true);
      expect(trie.contains('cut'), false);
      trie.insert('cut');
      expect(trie.contains('cute'), true);
      expect(trie.contains('cut'), true);
    });

    test('remove', () {
      final trie = StringTrie();
      expect(() => trie.remove('cut'), returnsNormally);
      trie.insert('cut');
      expect(trie.contains('cut'), true);
      trie.remove('cut');
      expect(trie.contains('cut'), false);
    });
  });

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
  });
}
