// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'swap.dart';

void insertionSort<E extends Comparable<dynamic>>(List<E> list) {
  // 1
  for (var current = 1; current < list.length; current++) {
    // 2
    for (var shifting = current; shifting > 0; shifting--) {
      // 3
      if (list[shifting].compareTo(list[shifting - 1]) < 0) {
        list.swap(shifting, shifting - 1);
      } else {
        break;
      }
    }
  }
}
