// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

extension SortedList<E extends Comparable<E>> on List<E> {
  int? binarySearch(E value) {
    var start = 0;
    var end = length;
    while (start < end) {
      final size = end - start;
      final middle = start + size ~/ 2;
      if (this[middle] == value) {
        return middle;
      } else if (this[middle].compareTo(value) < 0) {
        start = middle + 1;
      } else {
        end = middle;
      }
    }
    return null;
  }
}
