// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/avl_tree.dart';
import 'package:test/test.dart';

void main() {
  group('AVL tree:', () {
    test('height and balance factor', () {
      final tree = AvlTree<num>();
      tree.insert(50);
      expect(tree.root?.height, 0);
      tree.insert(25);
      expect(tree.root?.height, 1);
      tree.insert(75);
      expect(tree.root?.height, 1);
      tree.insert(37);
      expect(tree.root?.height, 2);
      expect(tree.root?.balanceFactor, 1);
      expect(tree.root?.leftChild?.height, 1);
      expect(tree.root?.leftChild?.balanceFactor, -1);
      expect(tree.root?.rightChild?.height, 0);
      expect(tree.root?.rightChild?.balanceFactor, 0);
      expect(tree.root?.leftChild?.rightChild, isNotNull);
    });

    test('left rotation', () {
      final tree = AvlTree<num>();
      tree.insert(25);
      tree.insert(37);
      tree.insert(40);
      expect(tree.toString(), '┌── 40\n37\n└── 25\n');
    });

    test('right rotation', () {
      final tree = AvlTree<num>();
      tree.insert(25);
      tree.insert(20);
      tree.insert(15);
      expect(tree.toString(), '┌── 25\n20\n└── 15\n');
    });

    test('right-left rotation', () {
      final tree = AvlTree<num>();
      tree.insert(25);
      tree.insert(37);
      tree.insert(36);
      expect(tree.toString(), '┌── 37\n36\n└── 25\n');
    });

    test('left-right rotation', () {
      final tree = AvlTree<num>();
      tree.insert(25);
      tree.insert(10);
      tree.insert(15);
      expect(tree.toString(), '┌── 25\n15\n└── 10\n');
    });

    test('removing elements maintains balanced tree', () {
      final tree = AvlTree<num>();
      tree.insert(15);
      tree.insert(10);
      tree.insert(16);
      tree.insert(18);
      tree.remove(10);
      expect(tree.toString(), '┌── 18\n16\n└── 15\n');
    });
  });
}
