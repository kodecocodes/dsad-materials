// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/linked_list.dart';
import 'package:test/test.dart';

void main() {
  group('Node:', () {
    test('toString with single node', () {
      final node = Node(value: 1);
      expect(node.toString(), '1');
    });

    test('toString with multiple nodes', () {
      final node1 = Node(value: 1);
      final node2 = Node(value: 2);
      node1.next = node2;
      expect(node1.toString(), '1 -> 2');
    });
  });

  group('LinkedList:', () {
    test('initial empty list has null head and tail', () {
      final list = LinkedList<int>();
      expect(list.head, isNull);
      expect(list.tail, isNull);
    });

    test('push one value', () {
      final list = LinkedList<int>();
      list.push(1);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 1);
      expect(identical(list.head, list.tail), true);
    });

    test('push two values', () {
      final list = LinkedList<int>();
      list.push(2);
      list.push(1);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 2);
      expect(list.head?.next?.value, 2);
      expect(list.tail?.next, null);
      expect(identical(list.head, list.tail), false);
    });

    test('append to empty list', () {
      final list = LinkedList<int>();
      list.append(1);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 1);
      expect(list.head?.next, null);
      expect(list.tail?.next, null);
    });

    test('append two values', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 2);
      expect(list.head?.next?.value, 2);
      expect(list.tail?.next, isNull);
    });

    test('find node in empty list', () {
      final list = LinkedList<int>();
      final node = list.nodeAt(0);
      expect(node, isNull);
    });

    test('find node single length list', () {
      final list = LinkedList<int>();
      list.append(1);
      final node = list.nodeAt(0);
      expect(node?.value, 1);
      expect(node?.next, isNull);
    });

    test('find node multi length list', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      final node = list.nodeAt(2);
      expect(node?.value, 3);
      expect(node?.next, isNull);
    });

    test('find node where index out of range', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      final node = list.nodeAt(99);
      expect(node, isNull);
    });

    test('insertAfter for multi length list', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.insertAfter(list.head!, 42);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 2);
      expect(list.head?.next?.value, 42);
      expect(list.tail?.next, isNull);
    });

    test('insertAfter tail', () {
      final list = LinkedList<int>();
      list.append(1);
      list.insertAfter(list.tail!, 2);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 2);
      expect(list.head?.next?.value, 2);
      expect(list.tail?.next, isNull);
    });

    test('pop from empty list', () {
      final list = LinkedList<int>();
      final value = list.pop();
      expect(value, isNull);
    });

    test('pop from single length list', () {
      final list = LinkedList<int>();
      list.push(1);
      final value = list.pop();
      expect(value, 1);
      expect(list.isEmpty, true);
      expect(list.head, isNull);
      expect(list.tail, isNull);
    });

    test('pop from multi length list', () {
      final list = LinkedList<int>();
      list.push(2);
      list.push(1);
      final value = list.pop();
      expect(value, 1);
      expect(list.isEmpty, false);
      expect(list.head?.value, 2);
      expect(list.tail?.value, 2);
      expect(list.tail?.next, isNull);
    });

    test('removeLast from empty list', () {
      final list = LinkedList<int>();
      final value = list.removeLast();
      expect(value, isNull);
    });

    test('removeLast from single length list', () {
      final list = LinkedList<int>();
      list.push(1);
      final value = list.removeLast();
      expect(value, 1);
      expect(list.isEmpty, true);
      expect(list.head, isNull);
      expect(list.tail, isNull);
      expect(list.head?.next, isNull);
      expect(list.tail?.next, isNull);
    });

    test('removeLast from length 2 list', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      final value = list.removeLast();
      expect(value, 2);
      expect(list.isEmpty, false);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 1);
      expect(list.head?.next, isNull);
      expect(list.tail?.next, isNull);
    });

    test('removeLast from multi length list', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      final value = list.removeLast();
      expect(value, 3);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 2);
      expect(list.head?.next, list.tail);
      expect(list.tail?.next, isNull);
    });

    test('removeAfter from single length list', () {
      final list = LinkedList<int>();
      list.push(1);
      final value = list.removeAfter(list.head!);
      expect(value, isNull);
      expect(list.isEmpty, false);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 1);
      expect(list.head?.next, isNull);
      expect(list.tail?.next, isNull);
    });

    test('removeAfter from length 2 list', () {
      final list = LinkedList<int>();
      list.push(1);
      list.append(2);
      final value = list.removeAfter(list.head!);
      expect(value, 2);
      expect(list.isEmpty, false);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 1);
      expect(list.head?.next, isNull);
      expect(list.tail?.next, isNull);
    });

    test('removeAfter from multi length list', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      final value = list.removeAfter(list.head!);
      expect(value, 2);
      expect(list.isEmpty, false);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 3);
      expect(list.head?.next, list.tail);
      expect(list.tail?.next, isNull);
    });
  });
}
