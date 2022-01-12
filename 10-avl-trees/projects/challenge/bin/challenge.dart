// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'dart:math' as math;

import 'package:challenge/avl_tree.dart';

void main() {
  challengeOne();
  challengeTwo();
  challengeThree();
}

/// Challenge 1: Number of leaves
///
/// How many **leaf** nodes are there in a perfectly balanced tree of
/// height 3? What about a perfectly balanced tree of height `h`?
void challengeOne() {
  // See the Challenge Solutions chapter for an explanation.
  print(leafNodes(3));
  print(leafNodes(4));
  print(leafNodes(5));
}

int leafNodes(int height) {
  return math.pow(2, height).toInt();
}

/// Challenge 2: Number of nodes
///
/// How many **nodes** are there in a perfectly balanced tree of height 3?
/// What about a perfectly balanced tree of height `h`?
void challengeTwo() {
  // See the Challenge Solutions chapter for an explanation.
  print(nodesOkSolution(3));
  print(nodesFasterSolution(3));
}

int nodesOkSolution(int height) {
  int nodes = 0;
  for (int h = 0; h <= height; h++) {
    nodes += math.pow(2, h).toInt();
  }
  return nodes;
}

int nodesFasterSolution(int height) {
  return math.pow(2, height + 1).toInt() - 1;
}

/// Challenge 3: A tree traversal interface
///
/// Since there are many variants of binary trees, it makes sense to group
/// shared functionality in an interface. The traversal methods are a good
/// candidate for this.
///
/// Create a `TraversableBinaryNode` abstract class that provides a default
/// implementation of the traversal methods so that conforming types get
/// these methods for free. Have `AvlNode` conform to this.
void challengeThree() {
  // See avl_node.dart for the updates.
  final tree = AvlTree<int>();
  for (var i = 0; i < 15; i++) {
    tree.insert(i);
  }
  tree.root?.traverseInOrder(print);
}
