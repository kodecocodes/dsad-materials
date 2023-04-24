// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/priority_queue_list.dart';
import 'package:test/test.dart';

void main() {
  group('PriorityQueueList (max):', () {
    test('isEmpty works', () {
      final queue = PriorityQueueList<num>();
      expect(queue.isEmpty, true);
      queue.enqueue(1);
      expect(queue.isEmpty, false);
    });

    test('peek works', () {
      final queue = PriorityQueueList<num>();
      expect(queue.peek, isNull);
      queue.enqueue(1);
      expect(queue.peek, 1);
    });

    test('enqueue works', () {
      final queue = PriorityQueueList<num>();
      queue.enqueue(1);
      expect(queue.isEmpty, false);
      expect(queue.peek, 1);
      final success = queue.enqueue(2);
      expect(success, true);
      expect(queue.isEmpty, false);
      expect(queue.peek, 2);
    });

    test('dequeue works', () {
      final queue = PriorityQueueList<num>();
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);
      expect(queue.dequeue(), 3);
      expect(queue.dequeue(), 2);
      queue.enqueue(4);
      expect(queue.dequeue(), 4);
      expect(queue.dequeue(), 1);
      expect(queue.dequeue(), isNull);
    });

    test('list input works', () {
      final queue = PriorityQueueList<num>(elements: [5, 8, 2, 1]);
      expect(queue.dequeue(), 8);
      expect(queue.dequeue(), 5);
      expect(queue.dequeue(), 2);
      expect(queue.dequeue(), 1);
      expect(queue.dequeue(), isNull);
    });
  });

  group('PriorityQueueList (min):', () {
    test('isEmpty works', () {
      final queue = PriorityQueueList<num>(priority: Priority.min);
      expect(queue.isEmpty, true);
      queue.enqueue(1);
      expect(queue.isEmpty, false);
    });

    test('peek works', () {
      final queue = PriorityQueueList<num>(priority: Priority.min);
      expect(queue.peek, isNull);
      queue.enqueue(1);
      expect(queue.peek, 1);
    });

    test('enqueue works', () {
      final queue = PriorityQueueList<num>(priority: Priority.min);
      queue.enqueue(1);
      expect(queue.isEmpty, false);
      expect(queue.peek, 1);
      final success = queue.enqueue(2);
      expect(success, true);
      expect(queue.isEmpty, false);
      expect(queue.peek, 1);
    });

    test('dequeue works', () {
      final queue = PriorityQueueList<num>(priority: Priority.min);
      queue.enqueue(1);
      queue.enqueue(2);
      queue.enqueue(3);
      expect(queue.dequeue(), 1);
      expect(queue.dequeue(), 2);
      queue.enqueue(4);
      expect(queue.dequeue(), 3);
      expect(queue.dequeue(), 4);
      expect(queue.dequeue(), isNull);
    });

    test('list input works', () {
      final queue = PriorityQueueList<num>(
        elements: [5, 8, 2, 1],
        priority: Priority.min,
      );
      expect(queue.dequeue(), 1);
      expect(queue.dequeue(), 2);
      expect(queue.dequeue(), 5);
      expect(queue.dequeue(), 8);
      expect(queue.dequeue(), isNull);
    });
  });
}
