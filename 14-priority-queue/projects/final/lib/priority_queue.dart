// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'heap.dart';
import 'queue.dart';

class PriorityQueue<E extends Comparable<dynamic>> implements Queue<E> {
  PriorityQueue({List<E>? elements, Priority priority = Priority.max}) {
    _heap = Heap<E>(elements: elements, priority: priority);
  }

  late Heap<E> _heap;

  // more to come
}
