// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'binary_tree.dart';
import 'dart:math';

void main() {
  challengeOne();
  challengeTwo();
}

/// Challenge 1: Height of a Tree
///
/// Given a binary tree, find the height of the tree. The height of the
/// binary tree is determined by the distance between the root and the
/// furthest leaf. The height of a binary tree with a single node is zero,
/// since the single node is both the root and the furthest leaf.
void challengeOne() {
  final tree = createBinaryTree();
  final treeHeight = height(tree);
  print(tree);
  print('Tree height: $treeHeight');
}

// Demo tree
//
//  ┌──25
//  │ └──17
// 15
//  │ ┌──12
//  └──10
//    └──5
BinaryNode<int> createBinaryTree() {
  final n15 = BinaryNode(15);
  final n10 = BinaryNode(10);
  final n5 = BinaryNode(5);
  final n12 = BinaryNode(12);
  final n25 = BinaryNode(25);
  final n17 = BinaryNode(17);

  n15.leftChild = n10;
  n10.leftChild = n5;
  n10.rightChild = n12;
  n15.rightChild = n25;
  n25.leftChild = n17;

  return n15;
}

int height(BinaryNode? node) {
  if (node == null) return -1;
  return 1 + max(height(node.leftChild), height(node.rightChild));
}

/// Challenge 2: Serialization
///
/// A common task in software development is serializing an object into another
/// data type. This process is known as serialization, and allows custom types
/// to be used in systems that only support a closed set of data types. An
/// example of serialization is JSON.
///
/// Your task is to devise a way to serialize a binary tree into a list, and a
/// way to deserialize the list back into the same binary tree.
///
/// To clarify this problem, consider the following binary tree:
///
/// ```
///  ┌──25
///  │ └──17
/// 15
///  │ ┌──12
///  └──10
///    └──5
/// ```
///
/// A particular algorithm may output the serialization as follows:
///
/// ```
/// [15, 10, 5, null, null, 12, null, null, 25, 17, null, null, null]
/// ```
///
/// The deserialization process should transform the array back into the same
/// binary tree. Note that there are many ways to perform serialization. You
/// may choose any way you wish.
void challengeTwo() {
  final tree = createBinaryTree();
  final list = serialize(tree);
  final newTree = deserializeHelper(list);
  print(newTree);
}

extension Serializable<T> on BinaryNode<T> {
  void traversePreOrderWithNull(void Function(T? value) action) {
    action(value);
    if (leftChild == null) {
      action(null);
    } else {
      leftChild!.traversePreOrderWithNull(action);
    }
    if (rightChild == null) {
      action(null);
    } else {
      rightChild!.traversePreOrderWithNull(action);
    }
  }
}

List<T?> serialize<T>(BinaryNode<T> node) {
  final list = <T?>[];
  node.traversePreOrderWithNull((value) => list.add(value));
  return list;
}

BinaryNode<T>? deserialize<T>(List<T?> list) {
  if (list.isEmpty) return null;
  final value = list.removeLast();
  if (value == null) return null;
  final node = BinaryNode<T>(value);
  node.leftChild = deserialize(list);
  node.rightChild = deserialize(list);
  return node;
}

BinaryNode<T>? deserializeHelper<T>(List<T?> list) {
  return deserialize(list.reversed.toList());
}
