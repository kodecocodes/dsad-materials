// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/bubble_sort.dart';
import 'package:final_project/insertion_sort.dart';
import 'package:final_project/selection_sort.dart';

void main() {
  bubbleSortExample();
  selectionSortExample();
  insertionSortExample();
}

void bubbleSortExample() {
  final list = <num>[9, 4, 10, 3];
  print('Original: $list');
  bubbleSort(list);
  print('Bubble sorted: $list');
}

void selectionSortExample() {
  final list = <num>[9, 4, 10, 3];
  print('Original: $list');
  selectionSort(list);
  print('Selection sorted: $list');
}

void insertionSortExample() {
  var list = <num>[9, 4, 10, 3];
  print('Original: $list');
  insertionSort(list);
  print('Insertion sorted: $list');
}
