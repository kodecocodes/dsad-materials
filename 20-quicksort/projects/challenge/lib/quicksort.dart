// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'stack.dart';

void quicksortIterativeLomuto<E extends Comparable<E>>(
  List<E> list,
) {
  var stack = Stack<int>();
  stack.push(0);
  stack.push(list.length - 1);

  while (stack.isNotEmpty) {
    final high = stack.pop();
    final low = stack.pop();
    final pivot = _partitionLomuto(list, low, high);

    if (pivot - 1 > low) {
      stack.push(low);
      stack.push(pivot - 1);
    }

    if (pivot + 1 < high) {
      stack.push(pivot + 1);
      stack.push(high);
    }
  }
}

int _partitionLomuto<E extends Comparable<E>>(
  List<E> list,
  int low,
  int high,
) {
  final pivot = list[high];

  var pivotIndex = low;
  for (int i = low; i < high; i++) {
    if (list[i].compareTo(pivot) <= 0) {
      list.swap(pivotIndex, i);
      pivotIndex += 1;
    }
  }

  list.swap(pivotIndex, high);
  return pivotIndex;
}

extension Swappable<E> on List<E> {
  void swap(int indexA, int indexB) {
    if (indexA == indexB) return;
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }
}
