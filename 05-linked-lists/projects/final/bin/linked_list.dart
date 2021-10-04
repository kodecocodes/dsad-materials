// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;
}
