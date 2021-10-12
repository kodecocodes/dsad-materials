// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/queue.dart';

void main() {
  final queue = QueueRingBuffer<String>(10);
  queue.enqueue("Ray");
  queue.enqueue("Brian");
  queue.enqueue("Eric");
  print(queue); // [Ray, Brian, Eric]

  queue.dequeue();
  print(queue); // [Brian, Eric]

  queue.peek;
  print(queue); // [Brian, Eric]
}
