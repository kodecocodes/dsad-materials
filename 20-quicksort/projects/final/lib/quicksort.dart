// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

List<E> quicksortNaive<E extends Comparable<dynamic>>(
  List<E> list,
) {
  if (list.length < 2) return list;
  final pivot = list[0];
  final less = list.where(
    (value) => value.compareTo(pivot) < 0,
  );
  final equal = list.where(
    (value) => value.compareTo(pivot) == 0,
  );
  final greater = list.where(
    (value) => value.compareTo(pivot) > 0,
  );
  return [
    ...quicksortNaive(less.toList()),
    ...equal,
    ...quicksortNaive(greater.toList()),
  ];
}

extension Swappable<E> on List<E> {
  void swap(int indexA, int indexB) {
    if (indexA == indexB) return;
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }
}

void quicksortLomuto<E extends Comparable<dynamic>>(
  List<E> list,
  int low,
  int high,
) {
  if (low >= high) return;
  final pivotIndex = _partitionLomuto(list, low, high);
  quicksortLomuto(list, low, pivotIndex - 1);
  quicksortLomuto(list, pivotIndex + 1, high);
}

int _partitionLomuto<T extends Comparable<dynamic>>(
  List<T> list,
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

void quicksortHoare<E extends Comparable<dynamic>>(
  List<E> list,
  int low,
  int high,
) {
  if (low >= high) return;
  final leftHigh = _partitionHoare(list, low, high);
  quicksortHoare(list, low, leftHigh);
  quicksortHoare(list, leftHigh + 1, high);
}

int _partitionHoare<T extends Comparable<dynamic>>(
  List<T> list,
  int low,
  int high,
) {
  final pivot = list[low];
  var left = low - 1;
  var right = high + 1;

  while (true) {
    do {
      left += 1;
    } while (list[left].compareTo(pivot) < 0);
    do {
      right -= 1;
    } while (list[right].compareTo(pivot) > 0);

    if (left < right) {
      list.swap(left, right);
    } else {
      return right;
    }
  }
}

void quicksortMedian<E extends Comparable<dynamic>>(
  List<E> list,
  int low,
  int high,
) {
  if (low >= high) return;
  var pivotIndex = _medianOfThree(list, low, high);
  list.swap(pivotIndex, high);
  pivotIndex = _partitionLomuto(list, low, high);
  quicksortLomuto(list, low, pivotIndex - 1);
  quicksortLomuto(list, pivotIndex + 1, high);
}

int _medianOfThree<T extends Comparable<dynamic>>(
  List<T> list,
  int low,
  int high,
) {
  final center = (low + high) ~/ 2;
  if (list[low].compareTo(list[center]) > 0) {
    list.swap(low, center);
  }
  if (list[low].compareTo(list[high]) > 0) {
    list.swap(low, high);
  }
  if (list[center].compareTo(list[high]) > 0) {
    list.swap(center, high);
  }
  return center;
}

void quicksortDutchFlag<E extends Comparable<dynamic>>(
  List<E> list,
  int low,
  int high,
) {
  if (low >= high) return;
  final middle = _partitionDutchFlag(list, low, high);
  quicksortDutchFlag(list, low, middle.low - 1);
  quicksortDutchFlag(list, middle.high + 1, high);
}

class Range {
  const Range(this.low, this.high);
  final int low;
  final int high;
}

Range _partitionDutchFlag<T extends Comparable<dynamic>>(
  List<T> list,
  int low,
  int high,
) {
  final pivot = list[high];
  var smaller = low;
  var equal = low;
  var larger = high;
  while (equal <= larger) {
    if (list[equal].compareTo(pivot) < 0) {
      list.swap(smaller, equal);
      smaller += 1;
      equal += 1;
    } else if (list[equal] == pivot) {
      equal += 1;
    } else {
      list.swap(equal, larger);
      larger -= 1;
    }
  }
  return Range(smaller, larger);
}
