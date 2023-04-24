// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/string_trie.dart';
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

    test('matchPrefix', () {
      final trie = StringTrie();
      trie.insert('cute');
      trie.insert('cut');
      expect(trie.matchPrefix('cu'), ['cut', 'cute']);
      expect(trie.matchPrefix('cute'), ['cute']);
    });
  });
}
