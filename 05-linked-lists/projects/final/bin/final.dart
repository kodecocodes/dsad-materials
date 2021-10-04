// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'linked_list.dart';

void main() {
  nodes();
  push();
  append();
  insertAfter();
}

void nodes() {
  final node1 = Node(value: 1);
  final node2 = Node(value: 2);
  final node3 = Node(value: 3);

  node1.next = node2;
  node2.next = node3;

  print(node1);
}

void push() {
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print(list);
}

void append() {
  final list = LinkedList<int>();
  list.append(1);
  list.append(2);
  list.append(3);

  print(list);
}

void insertAfter() {
  final list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print('Before: $list');

  var middleNode = list.nodeAt(1)!;
  list.insertAfter(middleNode, 42);

  print('After:  $list');
}
