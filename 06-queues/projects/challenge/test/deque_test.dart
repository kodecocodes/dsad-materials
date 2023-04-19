// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/deque.dart';
import 'package:test/test.dart';

void main() {
  group('Deque:', () {
    test('isEmpty works', () {
      final deque = DequeLinkedList<int>();
      expect(deque.isEmpty, true);
      deque.enqueue(1, Direction.front);
      expect(deque.isEmpty, false);
    });

    test('peek works', () {
      final deque = DequeLinkedList<int>();
      expect(deque.peek(Direction.back), isNull);
      deque.enqueue(1, Direction.back);
      deque.enqueue(2, Direction.back);
      expect(deque.peek(Direction.front), 1);
      expect(deque.peek(Direction.back), 2);
    });

    test('enqueue works', () {
      final deque = DequeLinkedList<int>();
      deque.enqueue(1, Direction.back);
      expect(deque.isEmpty, false);
      expect(deque.peek(Direction.front), 1);
      final success = deque.enqueue(2, Direction.front);
      expect(success, true);
      expect(deque.isEmpty, false);
      expect(deque.peek(Direction.front), 2);
      expect(deque.peek(Direction.back), 1);
    });

    test('dequeue works', () {
      final deque = DequeLinkedList<int>();
      deque.enqueue(1, Direction.back);
      deque.enqueue(2, Direction.back);
      deque.enqueue(3, Direction.back);
      expect(deque.dequeue(Direction.front), 1);
      expect(deque.dequeue(Direction.back), 3);
      deque.enqueue(4, Direction.back);
      expect(deque.dequeue(Direction.front), 2);
      expect(deque.dequeue(Direction.back), 4);
      expect(deque.dequeue(Direction.front), isNull);
      expect(deque.dequeue(Direction.back), isNull);
    });

    test('toString works', () {
      final deque = DequeLinkedList<int>();
      deque.enqueue(1, Direction.back);
      deque.enqueue(2, Direction.back);
      expect(deque.toString(), '1 -> 2');
    });
  });
}
