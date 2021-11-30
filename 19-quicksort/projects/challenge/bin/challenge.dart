// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:challenge/quicksort.dart';

void main() {
  challengeOne();
}

/// Challenge 1: Iterative Quicksort
///
/// In this chapter, you learned how to implement quicksort recursively.
/// Your challenge here is to implement it iteratively. Choose any
/// partition strategy.
void challengeOne() {
  final list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
  quicksortIterativeLomuto(list);
  print(list);
  // [2, 2, 2, 5, 8, 8, 8, 9, 9]
}
