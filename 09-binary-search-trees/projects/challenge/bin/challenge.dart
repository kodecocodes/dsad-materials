// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'binary_search_tree.dart';
import 'binary_node.dart';

void main() {
  challangeOne();
  challangeTwo();
  challangeThree();
}

/// Challenge 1: Binary tree or binary search tree?
///
/// Write a function that checks if a binary tree is a binary search tree.
void challangeOne() {
  final goodTree = BinaryNode<int>(4)
    ..leftChild = BinaryNode<int>(3)
    ..rightChild = BinaryNode<int>(4);
  print(goodTree.isBinarySearchTree());

  final badTree = BinaryNode<int>(4)
    ..leftChild = BinaryNode<int>(4)
    ..rightChild = BinaryNode<int>(5);
  print(badTree.isBinarySearchTree());
}

extension Checker<E extends Comparable<dynamic>> on BinaryNode<E> {
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
void challangeTwo() {
  final sameOne = BinarySearchTree<int>()
    ..insert(3)
    ..insert(5)
    ..insert(1);
  final sameTwo = BinarySearchTree<int>()
    ..insert(3)
    ..insert(5)
    ..insert(1);
  final different = BinarySearchTree<int>()
    ..insert(7)
    ..insert(9)
    ..insert(0);

  print(treesEqual(sameOne, sameTwo));
  print(treesEqual(sameOne, different));
}

bool treesEqual(BinarySearchTree first, BinarySearchTree second) {
  return _isEqual(first.root, second.root);
}

bool _isEqual(BinaryNode? first, BinaryNode? second) {
  if (first == null || second == null) {
    return first == null && second == null;
  }
  return first.value == second.value &&
      _isEqual(first.leftChild, second.leftChild) &&
      _isEqual(first.rightChild, second.rightChild);
}

/// Challenge 3: Is it a subtree?
///
/// Create a method that checks if the current tree contains all the
/// elements of another tree.
void challangeThree() {
  final tree = BinarySearchTree<int>()
    ..insert(3)
    ..insert(5)
    ..insert(1)
    ..insert(0)
    ..insert(2);
  final subtree = BinarySearchTree<int>()
    ..insert(1)
    ..insert(0)
    ..insert(2);
  final otherTree = BinarySearchTree<int>()
    ..insert(10)
    ..insert(2)
    ..insert(15);
  print(tree.containsSubtree(subtree));
  print(tree.containsSubtree(otherTree));
}

extension Subtree<E> on BinarySearchTree {
  bool containsSubtree(BinarySearchTree subtree) {
    // 1
    Set set = <E>{};
    root?.traverseInOrder((value) {
      set.add(value);
    });

    // 3
    var isEqual = true;

    // 4
    subtree.root?.traverseInOrder((value) {
      isEqual = isEqual && set.contains(value);
    });
    return isEqual;
  }
}
