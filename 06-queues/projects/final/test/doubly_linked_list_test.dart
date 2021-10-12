// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/doubly_linked_list.dart';
import 'package:test/test.dart';

void main() {
  group('Node:', () {
    test('toString with single node', () {
      final node = Node(value: 1);
      expect(node.toString(), '1');
    });
  });

  group('DoublyLinkedList:', () {
    test('initial empty list has null head and tail', () {
      final list = DoublyLinkedList<int>();
      expect(list.head, isNull);
      expect(list.tail, isNull);
    });

    test('push one value', () {
      final list = DoublyLinkedList<int>();
      list.push(1);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 1);
      expect(identical(list.head, list.tail), true);
    });

    test('push two values', () {
      final list = DoublyLinkedList<int>();
      list.push(2);
      list.push(1);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 2);
      expect(list.head?.next?.value, 2);
      expect(list.tail?.next, null);
      expect(list.tail?.previous?.value, 1);
      expect(list.head?.previous, null);
      expect(identical(list.head, list.tail), false);
    });

    test('append to empty list', () {
      final list = DoublyLinkedList<int>();
      list.append(1);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 1);
      expect(identical(list.head, list.tail), true);
    });

    test('append two values', () {
      final list = DoublyLinkedList<int>();
      list.append(1);
      list.append(2);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 2);
      expect(list.head?.next?.value, 2);
      expect(list.tail?.next, null);
      expect(list.tail?.previous?.value, 1);
      expect(list.head?.previous, null);
      expect(identical(list.head, list.tail), false);
    });

    test('pop from empty list', () {
      final list = DoublyLinkedList<int>();
      final value = list.pop();
      expect(value, isNull);
    });

    test('pop from single length list', () {
      final list = DoublyLinkedList<int>();
      list.push(1);
      final value = list.pop();
      expect(value, 1);
      expect(list.isEmpty, true);
      expect(list.head, isNull);
      expect(list.tail, isNull);
    });

    test('pop from length 2 list', () {
      final list = DoublyLinkedList<int>();
      list.push(2);
      list.push(1);
      final value = list.pop();
      expect(value, 1);
      expect(list.isEmpty, false);
      expect(list.head?.value, 2);
      expect(list.tail?.value, 2);
      expect(list.tail?.next, isNull);
      expect(list.head?.previous, isNull);
      expect(list.tail?.previous, isNull);
    });

    test('pop from length 3 list', () {
      final list = DoublyLinkedList<int>();
      list.push(3);
      list.push(2);
      list.push(1);
      final value = list.pop();
      expect(value, 1);
      expect(list.isEmpty, false);
      expect(list.head?.value, 2);
      expect(list.tail?.value, 3);
      expect(list.tail?.next, isNull);
      expect(list.head?.previous, isNull);
      expect(list.tail?.previous, list.head);
    });

    test('removeLast from empty list', () {
      final list = DoublyLinkedList<int>();
      final value = list.removeLast();
      expect(value, isNull);
    });

    test('removeLast from single length list', () {
      final list = DoublyLinkedList<int>();
      list.append(1);
      final value = list.removeLast();
      expect(value, 1);
      expect(list.isEmpty, true);
      expect(list.head, isNull);
      expect(list.tail, isNull);
    });

    test('removeLast from length 2 list', () {
      final list = DoublyLinkedList<int>();
      list.append(1);
      list.append(2);
      final value = list.removeLast();
      expect(value, 2);
      expect(list.isEmpty, false);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 1);
      expect(list.tail?.next, isNull);
      expect(list.head?.previous, isNull);
      expect(list.tail?.previous, isNull);
    });

    test('removeLast from length 3 list', () {
      final list = DoublyLinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      final value = list.removeLast();
      expect(value, 3);
      expect(list.isEmpty, false);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 2);
      expect(list.tail?.next, isNull);
      expect(list.head?.previous, isNull);
      expect(list.tail?.previous, list.head);
    });
  });
}
