// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/binary_node.dart';

void main() {
  binaryTree();
  inOrderTraversal();
  preOrderTraversal();
  postOrderTraversal();
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

void binaryTree() {
  final tree = createBinaryTree();
  print(tree);
}

void inOrderTraversal() {
  print('traverseInOrder');
  final tree = createBinaryTree();
  tree.traverseInOrder(print);
}

void preOrderTraversal() {
  print('traversePreOrder');
  final tree = createBinaryTree();
  tree.traversePreOrder(print);
}

void postOrderTraversal() {
  print('traversePostOrder');
  final tree = createBinaryTree();
  tree.traversePostOrder(print);
}
