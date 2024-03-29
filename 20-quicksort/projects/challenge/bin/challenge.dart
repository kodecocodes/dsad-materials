// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/quicksort.dart';

void main() {
  challengeOne();
  challengeTwo();
}

/// Challenge 1: Iterative Quicksort
///
/// In this chapter, you learned how to implement quicksort recursively.
/// Your challenge here is to implement it iteratively. Choose any
/// partition strategy.
void challengeOne() {
  final list = <num>[8, 2, 10, 0, 9, 18, 9, -1, 5];
  quicksortIterativeLomuto(list);
  print(list);
}

/// Challenge 2: Merge Sort or Quicksort
///
/// Explain when and why you would use merge sort over quicksort.
void challengeTwo() {
  // See the explanation in the Challenge Solutions chapter.
}
