// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

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
}
