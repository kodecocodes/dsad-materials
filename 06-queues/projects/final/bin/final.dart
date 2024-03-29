// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/queue.dart';

void main() {
  queueListExample();
  queueLinkedListExample();
  queueRingBufferExample();
  queueDoubleStackExample();
}

void queueListExample() {
  final queue = QueueList<String>();
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek;
  print(queue);
}

void queueLinkedListExample() {
  final queue = QueueLinkedList<String>();
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek;
  print(queue);
}

void queueRingBufferExample() {
  final queue = QueueRingBuffer<String>(10);
  queue.enqueue("Ray");
  queue.enqueue("Brian");
  queue.enqueue("Eric");
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek;
  print(queue);
}

void queueDoubleStackExample() {
  final queue = QueueStack<String>();
  queue.enqueue("Ray");
  queue.enqueue("Brian");
  queue.enqueue("Eric");
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek;
  print(queue);
}
