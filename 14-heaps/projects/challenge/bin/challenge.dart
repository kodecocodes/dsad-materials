// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/heap.dart';

void main() {
  challengeOne();
  challengeTwo();
  challengeThree();
  challengeFour();
}

/// Challenge 1: Find the Nth Smallest Number
///
/// Write a function to find the nth smallest number in an unsorted list.
/// For example, given the following list:
///
/// ```
/// final numbers = [3, 10, 18, 5, 21, 100];
/// ```
///
/// If `n = 3`, the result should be `10`.
void challengeOne() {
  final numbers = [3, 10, 18, 5, 21, 100];
  print(getNthSmallestElement(3, numbers));
}

num? getNthSmallestElement(int n, List<num> elements) {
  var heap = Heap<num>(
    elements: elements,
    priority: Priority.min,
  );
  num? value;
  for (int i = 0; i < n; i++) {
    value = heap.remove();
  }
  return value;
}

/// Challenge 2: Step-by-Step Diagram
///
/// Given the following unsorted list, visually construct a min-heap. Provide a
/// step-by-step diagram of how the min-heap is formed.
///
/// ```
/// [21, 10, 18, 5, 3, 100, 1]
/// ```
void challengeTwo() {
  // See the Challenge Solutions chapter for the step-by-step diagrams.
  final heap = Heap<num>(
    elements: [21, 10, 18, 5, 3, 100, 1],
    priority: Priority.min,
  );
  print(heap);
}

/// Challenge 3: Combining Two Heaps
///
/// Write a method that combines two heaps.
void challengeThree() {
  // See heap.dart for the implementation.
  final listA = [21, 10, 18, 5, 3, 100, 1];
  final listB = [30, 9, 4, 2, 70, 99];
  final heap = Heap<num>(elements: listA);
  heap.merge(listB);
  print(heap);
}

/// Challenge 4: Is it a Min-Heap?
///
/// Write a function to check if a given list is a min-heap.
void challengeFour() {
  print(isMinHeap(<num>[1, 3, 18, 5, 10, 100, 21]));
  print(isMinHeap(<num>[10, 3, 18, 5, 10, 100, 21]));
}

bool isMinHeap<E extends Comparable<E>>(List<E> elements) {
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
