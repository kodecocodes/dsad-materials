// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'swap.dart';

void selectionSort<E extends Comparable<dynamic>>(List<E> list) {
  // 1
  for (var start = 0; start < list.length - 1; start++) {
    var lowest = start;
    // 2
    for (var next = start + 1; next < list.length; next++) {
      if (list[next].compareTo(list[lowest]) < 0) {
        lowest = next;
      }
    }
    // 3
    if (lowest != start) {
      list.swap(lowest, start);
    }
  }
}
