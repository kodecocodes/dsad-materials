// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'swap.dart';

void selectionSort<E extends Comparable<E>>(List<E> list) {
  for (var start = 0; start < list.length - 1; start++) {
    var lowest = start;
    for (var next = start + 1; next < list.length; next++) {
      if (list[next].compareTo(list[lowest]) < 0) {
        lowest = next;
      }
    }
    if (lowest != start) {
      list.swap(lowest, start);
    }
  }
}
