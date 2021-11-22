// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'linked_list.dart';

void main() {
  challengeOne();
  challengeTwo();
  challengeThree();
  challengeFour();
}

/// Challenge 1: Print in reverse
///
/// Create a function that prints the nodes of a linked list in reverse
/// order. For example:
///
/// 1 -> 2 -> 3 -> null
///
/// should print out the following:
/// 3
/// 2
/// 1
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
/// 1 -> 2 -> 3 -> 4 -> null
/// middle is 3
///
/// 1 -> 2 -> 3 -> null
/// middle is 2
void challengeTwo() {
  var list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);
  print(list);

  final middleNode = getMiddle(list);
  print('Middle: ${middleNode?.value}');
}

Node<E>? getMiddle<E>(LinkedList<E> list) {
  var slow = list.head;
  var fast = list.head;

  while (fast?.next != null) {
    fast = fast?.next?.next;
    slow = slow?.next;
  }

  return slow;
}

/// Challenge 3: Reverse a linked list
///
/// Create a function that reverses a linked list. You do this by
/// manipulating the nodes so that they’re linked in the other direction.
/// For example:
///
/// before
/// 1 -> 2 -> 3 -> null
///
/// after
/// 3 -> 2 -> 1 -> null
void challengeThree() {
  var list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);

  print('Original list: $list');
  list.reverse();
  print('Reversed list: $list');
}

extension ReversibleLinkedList<E> on LinkedList<E> {
  // void reverse() {
  //   final tempList = LinkedList<E>();
  //   for (final value in this) {
  //     tempList.push(value);
  //   }
  //   head = tempList.head;
  // }

  void reverse() {
    tail = head;
    var previous = head;
    var current = head?.next;
    previous?.next = null;

    while (current != null) {
      final next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }

    head = previous;
  }
}

/// Challenge 4: Remove all occurrences
///
/// Create a function that removes all occurrences of a specific element
/// from a linked list. The implementation is similar to the removeAfter
/// method that you implemented for the linked list. For example:
///
/// ```
/// original list
/// 1 -> 3 -> 3 -> 3 -> 4
///
/// list after removing all occurrences of 3
/// 1 -> 4
/// ```
void challengeFour() {
  var list = LinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(2);
  list.push(1);
  list.push(1);

  list.removeAll(3);
  print(list);
}

extension RemovableLinkedList<E> on LinkedList {
  void removeAll(E value) {
    while (head != null && head!.value == value) {
      head = head!.next;
    }
    var previous = head;
    var current = head?.next;
    while (current != null) {
      if (current.value == value) {
        previous?.next = current.next;
        current = previous?.next;
        continue;
      }
      previous = current;
      current = current.next;
    }
    tail = previous;
  }
}

// extension RemovableLinkedList<E> on LinkedList {
//   void removeAll(E value) {
//     while (head != null && head!.value == value) {
//       head = head!.next;
//     }

//     var previous = head;
//     var current = head?.next;
//     while (current != null) {
//       if (current.value == value) {
//         previous?.next = current.next;
//         current = previous?.next;
//         continue;
//       }
//       previous = current;
//       current = current.next;
//     }
//     tail = previous;
//   }
// }
