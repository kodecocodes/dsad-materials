// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'linked_list.dart';

void main() {
  challengeOne();
  challengeTwo();
}

/// Challenge 1: Print in reverse
///
/// Create a function that prints the nodes of a linked list in reverse
/// order. For example:
///
/// ```
/// 1 -> 2 -> 3 -> null
///
/// // should print out the following:
/// 3
/// 2
/// 1
/// ```
void challengeOne() {
  var list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print('Original list: $list');
  print("Printing in reverse:");
  printListInReverse(list);
}

void printListInReverse<E>(LinkedList<E> list) {
  printNodesRecursively(list.head);
}

void printNodesRecursively<T>(Node<T>? node) {
  if (node == null) return;
  printNodesRecursively(node.next);
  print(node.value);
}

/// Challenge 2: Find the middle node
///
/// Create a function that finds the middle node of a linked list.
/// For example:
///
/// ```
/// 1 -> 2 -> 3 -> 4 -> null
/// // middle is 3
///
/// 1 -> 2 -> 3 -> null
/// // middle is 2
/// ```
void challengeTwo() {}
