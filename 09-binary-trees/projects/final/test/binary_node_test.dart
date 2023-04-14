// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/binary_node.dart';
import 'package:test/test.dart';

void main() {
  group('Binary Node:', () {
    test('toString', () {
      final tree = createBinaryTree();
      expect(
          tree.toString(),
          ' ┌── null\n'
          '┌──9\n'
          '│ └── 8\n'
          '7\n'
          '│ ┌── 5\n'
          '└──1\n'
          ' └── 0\n');
    });

    test('traverseInOrder', () {
      final tree = createBinaryTree();
      final buffer = StringBuffer();
      tree.traverseInOrder((value) => buffer.write(value));
      expect(buffer.toString(), '015789');
    });

    test('traversePreOrder', () {
      final tree = createBinaryTree();
      final buffer = StringBuffer();
      tree.traversePreOrder((value) => buffer.write(value));
      expect(buffer.toString(), '710598');
    });

    test('traversePostOrder', () {
      final tree = createBinaryTree();
      final buffer = StringBuffer();
      tree.traversePostOrder((value) => buffer.write(value));
      expect(buffer.toString(), '051897');
    });
  });
}

BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);

  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;

  return seven;
}
