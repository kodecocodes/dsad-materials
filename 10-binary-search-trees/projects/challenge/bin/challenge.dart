// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/binary_node.dart';
import 'package:challenge/binary_search_tree.dart';

void main() {
  challengeOne();
  challengeTwo();
  challengeThree();
}

/// Challenge 1: Binary Tree or Binary Search Tree?
///
/// Write a function that checks if a binary tree is a binary search tree.
void challengeOne() {
  final goodTree = BinaryNode<num>(4)
    ..leftChild = BinaryNode<num>(3)
    ..rightChild = BinaryNode<num>(4);
  print(goodTree.isBinarySearchTree());

  final badTree = BinaryNode<num>(4)
    ..leftChild = BinaryNode<num>(4)
    ..rightChild = BinaryNode<num>(5);
  print(badTree.isBinarySearchTree());
}

extension Checker<E extends Comparable<E>> on BinaryNode<E> {
  bool isBinarySearchTree() {
    return _isBST(this, min: null, max: null);
  }

  bool _isBST(BinaryNode<E>? tree, {E? min, E? max}) {
    if (tree == null) return true;

    if (min != null && tree.value.compareTo(min) < 0) {
      return false;
    } else if (max != null && tree.value.compareTo(max) >= 0) {
      return false;
    }

    return _isBST(tree.leftChild, min: min, max: tree.value) &&
        _isBST(tree.rightChild, min: tree.value, max: max);
  }
}

/// Challenge 2: Equality
///
/// Given two binary trees, how would you test if they are equal or not?
void challengeTwo() {
  final sameOne = BinarySearchTree<num>()
    ..insert(3)
    ..insert(5)
    ..insert(1);
  final sameTwo = BinarySearchTree<num>()
    ..insert(3)
    ..insert(5)
    ..insert(1);
  final different = BinarySearchTree<num>()
    ..insert(7)
    ..insert(9)
    ..insert(0);

  print(treesEqual(sameOne, sameTwo));
  print(treesEqual(sameOne, different));
}

bool treesEqual(BinarySearchTree first, BinarySearchTree second) {
  return _isEqual(first.root, second.root);
}

bool _isEqual<T>(
  BinaryNode<Comparable<T>>? first,
  BinaryNode<Comparable<T>>? second,
) {
  if (first == null || second == null) {
    return first == null && second == null;
  }
  return first.value == second.value &&
      _isEqual(first.leftChild, second.leftChild) &&
      _isEqual(first.rightChild, second.rightChild);
}

/// Challenge 3: Is it a Subtree?
///
/// Create a method that checks if the current tree contains all the
/// elements of another tree.
void challengeThree() {
  final tree = BinarySearchTree<num>()
    ..insert(3)
    ..insert(5)
    ..insert(1)
    ..insert(0)
    ..insert(2);
  final subtree = BinarySearchTree<num>()
    ..insert(1)
    ..insert(0)
    ..insert(2);
  final otherTree = BinarySearchTree<num>()
    ..insert(10)
    ..insert(2)
    ..insert(15);
  print(tree.containsSubtree(subtree));
  print(tree.containsSubtree(otherTree));
}

extension Subtree<E extends Comparable<E>> on BinarySearchTree<E> {
  bool containsSubtree(BinarySearchTree subtree) {
    final set = <E>{};
    root?.traverseInOrder((value) {
      set.add(value);
    });
    var isEqual = true;
    subtree.root?.traverseInOrder((value) {
      isEqual = isEqual && set.contains(value);
    });
    return isEqual;
  }
}
