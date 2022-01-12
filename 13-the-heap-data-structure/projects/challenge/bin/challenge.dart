// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:challenge/heap.dart';

void main() {
  challengeOne();
  challengeTwo();
  challengeThree();
  challengeFour();
}

/// Challenge 1: Find the nth smallest integer
///
/// Write a function to find the nth smallest integer in an unsorted list.
/// For example:
///
/// ```
/// final integers = [3, 10, 18, 5, 21, 100];
/// ```
///
/// If `n = 3`, the result should be `10`.
void challengeOne() {
  final integers = [3, 10, 18, 5, 21, 100];
  print(getNthSmallestElement(3, integers));
}

int? getNthSmallestElement(int n, List<int> elements) {
  var heap = Heap(
    elements: elements,
    priority: Priority.min,
  );
  int? value;
  for (int i = 0; i < n; i++) {
    value = heap.remove();
  }
  return value;
}

/// Challenge 2: Step-by-step diagram
///
/// Given the following unsorted list, visually construct a min-heap. Provide a
/// step-by-step diagram of how the min-heap is formed.
///
/// ```
/// [21, 10, 18, 5, 3, 100, 1]
/// ```
void challengeTwo() {
  // See the Challenge Solutions chapter for the step-by-step diagrams.
  final heap = Heap(
    elements: [21, 10, 18, 5, 3, 100, 1],
    priority: Priority.min,
  );
  print(heap);
}

/// Challenge 3: Combining two heaps
///
/// Write a method that combines two heaps.
void challengeThree() {
  // See heap.dart for the implementation.
  final listA = [21, 10, 18, 5, 3, 100, 1];
  final listB = [30, 9, 4, 2, 70, 99];
  final heap = Heap(elements: listA);
  heap.merge(listB);
  print(heap);
}

/// Challenge 4: Is it a min-heap?
///
/// Write a function to check if a given list is a min-heap.
void challengeFour() {
  print(isMinHeap([1, 3, 18, 5, 10, 100, 21]));
  print(isMinHeap([10, 3, 18, 5, 10, 100, 21]));
}

bool isMinHeap<E extends Comparable<dynamic>>(List<E> elements) {
  if (elements.isEmpty) return true;
  final start = elements.length ~/ 2 - 1;
  for (var i = start; i >= 0; i--) {
    final left = 2 * i + 1;
    final right = 2 * i + 2;
    if (elements[left].compareTo(elements[i]) < 0) {
      return false;
    }
    if (right < elements.length && elements[right].compareTo(elements[i]) < 0) {
      return false;
    }
  }
  return true;
}
