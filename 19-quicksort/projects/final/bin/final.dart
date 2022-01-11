// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/quicksort.dart';

void main() {
  naive();
  lomuto();
  hoare();
  median();
  dutchFlag();
}

void naive() {
  final list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
  final sorted = quicksortNaive(list);
  print(sorted);
}

void lomuto() {
  final list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
  quicksortLomuto(list, 0, list.length - 1);
  print(list);
}

void hoare() {
  final list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
  quicksortHoare(list, 0, list.length - 1);
  print(list);
}

void median() {
  final list = [8, 7, 6, 5, 4, 3, 2, 1];
  quicksortMedian(list, 0, list.length - 1);
  print(list);
}

void dutchFlag() {
  final list = [8, 2, 2, 8, 9, 5, 9, 2, 8];
  quicksortDutchFlag(list, 0, list.length - 1);
  print(list);
}
