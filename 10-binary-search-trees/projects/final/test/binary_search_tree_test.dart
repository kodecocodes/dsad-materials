// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/binary_search_tree.dart';
import 'package:test/test.dart';

void main() {
  group('BinarySearchTree:', () {
    test('insert', () {
      final tree = BinarySearchTree<num>();
      tree.insert(3);
      expect(tree.toString(), ' 3\n');
      tree.insert(2);
      expect(tree.toString(), '┌── null\n3\n└── 2\n');
      tree.insert(4);
      expect(tree.toString(), '┌── 4\n3\n└── 2\n');
    });

    test('remove leaf', () {
      final tree = BinarySearchTree<num>();
      tree.insert(3);
      tree.insert(2);
      tree.remove(2);
      expect(tree.toString(), ' 3\n');
    });

    test('remove node with left child', () {
      final tree = BinarySearchTree<num>();
      tree.insert(3);
      tree.insert(2);
      tree.insert(1);
      tree.remove(2);
      expect(tree.toString(), '┌── null\n3\n└── 1\n');
    });

    test('remove node with right child', () {
      final tree = BinarySearchTree<num>();
      tree.insert(5);
      tree.insert(2);
      tree.insert(3);
      tree.remove(2);
      expect(tree.toString(), '┌── null\n5\n└── 3\n');
    });

    test('remove node with two children', () {
      final tree = BinarySearchTree<num>();
      tree.insert(5);
      tree.insert(2);
      tree.insert(3);
      tree.insert(1);
      tree.remove(2);
      expect(tree.toString(), '┌── null\n5\n│ ┌── null\n└──3\n └── 1\n');
    });

    test('contains', () {
      final tree = BinarySearchTree<num>();
      tree.insert(3);
      tree.insert(2);
      expect(tree.contains(2), true);
      expect(tree.contains(1), false);
    });
  });
}
