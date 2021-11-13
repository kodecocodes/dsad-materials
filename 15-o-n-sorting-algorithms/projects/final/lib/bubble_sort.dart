// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'swap.dart';

void bubbleSort<E extends Comparable<dynamic>>(List<E> list) {
  // 1
  for (var end = list.length - 1; end > 0; end--) {
    var swapped = false;
    // 2
    for (var current = 0; current < end; current++) {
      if (list[current].compareTo(list[current + 1]) > 0) {
        list.swap(current, current + 1);
        swapped = true;
      }
    }
    // 3
    if (!swapped) return;
  }
}
