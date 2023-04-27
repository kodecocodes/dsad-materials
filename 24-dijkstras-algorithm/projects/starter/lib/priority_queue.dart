// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'heap.dart';
import 'queue.dart';

export 'heap.dart' show Priority;

class PriorityQueue<E extends Comparable<E>> implements Queue<E> {
  PriorityQueue({List<E>? elements, Priority priority = Priority.max}) {
    _heap = Heap<E>(elements: elements, priority: priority);
  }

  late Heap<E> _heap;

  @override
  bool get isEmpty => _heap.isEmpty;

  @override
  E? get peek => _heap.peek;

  @override
  bool enqueue(E element) {
    _heap.insert(element);
    return true;
  }

  @override
  E? dequeue() => _heap.remove();
}
