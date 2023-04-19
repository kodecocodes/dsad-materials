// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/queue.dart';
import 'package:test/test.dart';

void main() {
  group('QueueList:', () {
    test('isEmpty works', () {
      final queue = QueueList<int>();
      expect(queue.isEmpty, true);
      queue.enqueue(1);
      expect(queue.isEmpty, false);
    });

    test('peek works', () {
      final queue = QueueList<int>();
      expect(queue.peek, isNull);
      queue.enqueue(1);
      expect(queue.peek, 1);
    });

    test('enqueue works', () {
      final queue = QueueList<int>();
      queue.enqueue(1);
      expect(queue.isEmpty, false);
      expect(queue.peek, 1);
      final success = queue.enqueue(2);
      expect(success, true);
      expect(queue.isEmpty, false);
      expect(queue.peek, 1);
    });

    test('dequeue works', () {
      final queue = QueueList<int>();
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

    test('toString works', () {
      final queue = QueueList<int>();
      queue.enqueue(1);
      queue.enqueue(2);
      expect(queue.toString(), '[1, 2]');
    });
  });

  group('QueueLinkedList:', () {
    test('isEmpty works', () {
      final queue = QueueLinkedList<int>();
      expect(queue.isEmpty, true);
      queue.enqueue(1);
      expect(queue.isEmpty, false);
    });

    test('peek works', () {
      final queue = QueueLinkedList<int>();
      expect(queue.peek, isNull);
      queue.enqueue(1);
      expect(queue.peek, 1);
    });

    test('enqueue works', () {
      final queue = QueueLinkedList<int>();
      queue.enqueue(1);
      expect(queue.isEmpty, false);
      expect(queue.peek, 1);
      final success = queue.enqueue(2);
      expect(success, true);
      expect(queue.isEmpty, false);
      expect(queue.peek, 1);
    });

    test('dequeue works', () {
      final queue = QueueLinkedList<int>();
      expect(queue.dequeue(), isNull);
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

    test('toString works', () {
      final queue = QueueLinkedList<int>();
      queue.enqueue(1);
      queue.enqueue(2);
      expect(queue.toString(), '1 -> 2');
    });
  });

  group('QueueRingBuffer:', () {
    test('isEmpty works', () {
      final queue = QueueRingBuffer<int>(4);
      expect(queue.isEmpty, true);
      queue.enqueue(1);
      expect(queue.isEmpty, false);
    });

    test('peek works', () {
      final queue = QueueRingBuffer<int>(4);
      expect(queue.peek, isNull);
      queue.enqueue(1);
      expect(queue.peek, 1);
    });

    test('enqueue works', () {
      final queue = QueueRingBuffer<int>(4);
      queue.enqueue(1);
      expect(queue.isEmpty, false);
      expect(queue.peek, 1);
      final success = queue.enqueue(2);
      expect(success, true);
      expect(queue.isEmpty, false);
      expect(queue.peek, 1);
    });

    test('dequeue works', () {
      final queue = QueueRingBuffer<int>(4);
      expect(queue.dequeue(), isNull);
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

    test('toString works', () {
      final queue = QueueRingBuffer<int>(4);
      queue.enqueue(1);
      queue.enqueue(2);
      expect(queue.toString(), '[1, 2]');
    });
  });
}
