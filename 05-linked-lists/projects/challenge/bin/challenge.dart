// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'linked_list.dart';

void main() {
  challengeOne();
}

/// Challenge 1: Print in reverse
///
/// Create a function that prints the nodes of a linked list in reverse
/// order. For example:
///
/// ```text
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
