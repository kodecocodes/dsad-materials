// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'swap.dart';

void insertionSort<E extends Comparable<dynamic>>(List<E> list) {
  for (var current = 1; current < list.length; current++) {
    for (var shifting = current; shifting > 0; shifting--) {
      if (list[shifting].compareTo(list[shifting - 1]) < 0) {
        list.swap(shifting, shifting - 1);
      } else {
        break;
      }
    }
  }
}
