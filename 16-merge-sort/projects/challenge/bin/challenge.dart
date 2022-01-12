// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:challenge/merge_sort_1.dart' as challenge1;
import 'package:challenge/merge_sort_2.dart' as challenge2;

void main() {
  challengeOne();
  challengeTwo();
}

/// Challenge 1: Mind merge
///
/// Given the following list:
///
/// [4, 2, 5, 1, 3]
///
/// Work through the steps merge sort would take. Go slowly enough for
/// your brain to understand what's happening. You'll have the easiest
/// time if you use breakpoints in your IDE or add `print` statements
/// to your code.
void challengeOne() {
  // See the lib/merge_sort_1.dart source code for the placement of the
  // `print` statements.
  final list = [4, 2, 5, 1, 3];
  final sorted = challenge1.mergeSort(list);
  print(sorted);
}

/// Challenge 2: Merge two sequences
///
/// In this chapter you created a `_merge` function that merges two
/// sorted lists. The challenge here is to generalize `_merge` so that
/// it takes two iterables as inputs rather than lists. Here’s the
/// function signature to start off:
///
/// ```
/// List<E> _merge<E extends Comparable<dynamic>>(
///   Iterable<E> first,
///   Iterable<E> second,
/// )
/// ```
void challengeTwo() {
  // See lib/merge_sort_2.dart for the source code.
  final list = [7, 2, 6, 3, 9];
  final sorted = challenge2.mergeSort(list);
  print(sorted);
}
