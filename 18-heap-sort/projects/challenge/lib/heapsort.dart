// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'heap.dart';

List<E> heapsort<E extends Comparable<dynamic>>(List<E> list) {
  final heap = Heap<E>(
    elements: list.toList(),
    priority: Priority.min,
  );

  final sorted = <E>[];
  while (!heap.isEmpty) {
    final value = heap.remove();
    sorted.add(value!);
  }
  return sorted;
}

/// This implementation adds print statements so that you can observe the
/// comparisons that it makes while building the heap and sorting the list.
extension Heapsort<E extends Comparable<dynamic>> on List<E> {
  void heapsortInPlace() {
    if (isEmpty) return;

    print('Building heap:');
    final start = length ~/ 2 - 1;
    for (var i = start; i >= 0; i--) {
      _siftDown(start: i, end: length);
    }

    print('Sorting list:');
    for (var i = length - 1; i > 0; i--) {
      _swapValues(0, i);
      _siftDown(start: 0, end: i);
    }
  }

  int _leftChildIndex(int parentIndex) {
    return 2 * parentIndex + 1;
  }

  int _rightChildIndex(int parentIndex) {
    return 2 * parentIndex + 2;
  }

  void _swapValues(int indexA, int indexB) {
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }

  void _siftDown({required int start, required int end}) {
    var parent = start;
    while (true) {
      final left = _leftChildIndex(parent);
      final right = _rightChildIndex(parent);
      var chosen = parent;
      if (left < end) {
        print('Comparing ${this[chosen]} and ${this[left]}');
        if (this[left].compareTo(this[chosen]) > 0) {
          chosen = left;
        }
      }
      if (right < end) {
        print('Comparing ${this[chosen]} and ${this[right]}');
        if (this[right].compareTo(this[chosen]) > 0) {
          chosen = right;
        }
      }
      if (chosen == parent) return;
      _swapValues(parent, chosen);
      parent = chosen;
    }
  }
}
