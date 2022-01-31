// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/radix_sort.dart';

void main() {
  lsdRadixSort();
  numberOfDigits();
  digitAtPosition();
  maxDigits();
  msdRadixSort();
}

void lsdRadixSort() {
  final list = [88, 410, 1772, 20];
  print("Original list: $list");
  list.radixSort();
  print("Radix sorted: $list");
}

void numberOfDigits() {
  print(13.digits());
  print(999.digits());
  print(1345.digits());
}

void digitAtPosition() {
  print(1345.digitAt(0));
  print(1345.digitAt(1));
  print(1345.digitAt(2));
  print(1345.digitAt(3));
  print(1345.digitAt(4));
  print(1345.digitAt(5));
}

void maxDigits() {
  final list = [46, 500, 459, 1345, 13, 999];
  print(list.maxDigits());
}

void msdRadixSort() {
  final list = [46, 500, 459, 1345, 13, 999];
  list.lexicographicalSort();
  print(list);
}
