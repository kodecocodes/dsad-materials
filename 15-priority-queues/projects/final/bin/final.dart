// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/priority_queue.dart';

void main() {
  var priorityQueue = PriorityQueue<num>(
    elements: [1, 12, 3, 4, 1, 6, 8, 7],
  );
  while (!priorityQueue.isEmpty) {
    print(priorityQueue.dequeue()!);
  }
}
