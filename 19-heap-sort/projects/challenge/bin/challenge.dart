// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/heapsort.dart';
import 'package:challenge/heapsort_descending.dart';

void main() {
  challengeOne();
  challengeTwo();
}

/// When performing heapsort in ascending order, which of these starting
/// lists requires the fewest comparisons?
///
/// - `[1, 2, 3, 4, 5]`
/// - `[5, 4, 3, 2, 1]`
///
/// You can assume that the implementation uses a max-heap.
void challengeOne() {
  var list = <num>[5, 4, 3, 2, 1];
  print(list);
  list.heapsortInPlace();
  print(list);
  print('---');
  list = [1, 2, 3, 4, 5];
  print(list);
  list.heapsortInPlace();
  print(list);
}

/// The current implementations of heapsort in in this chapter sort the
/// elements in ascending order. How would you sort in descending order?
void challengeTwo() {
  usingReversed();
  reimplementingHeapsort();
  reimplementingHeapsortInPlace();
}

void usingReversed() {
  print('using reversed');

  final list = <num>[6, 12, 2, 26, 8, 18, 21, 9, 5];
  final ascending = heapsort(list);
  final descending = ascending.reversed;

  print(list);
  print(ascending);
  print(descending.toList());
}

void reimplementingHeapsort() {
  print('reimplementing heapsort');

  final list = <num>[6, 12, 2, 26, 8, 18, 21, 9, 5];
  final sorted = descendingHeapsort(list);

  print(sorted);
}

void reimplementingHeapsortInPlace() {
  print('reimplementing heapsortInPlace');

  final list = <num>[6, 12, 2, 26, 8, 18, 21, 9, 5];
  list.descendingHeapsortInPlace();

  print(list);
}
