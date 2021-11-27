// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:challenge/heapsort.dart';
import 'package:challenge/heapsort_ascending.dart';

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
/// You can assume that the internal implementation uses a max heap.
void challengeOne() {
  var list = [5, 4, 3, 2, 1];
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
/// elements in _ascending_ order. How would you sort in _descending_ order?
void challengeTwo() {
  usingReversed();
  reimplementingHeapsort();
  reimplementingHeapsortInPlace();
}

void usingReversed() {
  print('using reveresed');

  final list = [6, 12, 2, 26, 8, 18, 21, 9, 5];
  final ascending = heapsort(list);
  final descending = ascending.reversed;

  print(list);
  print(ascending);
  print(descending.toList());
}

void reimplementingHeapsort() {
  print('reimplementing heapsort');

  final list = [6, 12, 2, 26, 8, 18, 21, 9, 5];
  final sorted = descendingHeapsort(list);

  print(sorted);
}

void reimplementingHeapsortInPlace() {
  print('reimplementing heapsortInPlace');

  final list = [6, 12, 2, 26, 8, 18, 21, 9, 5];
  list.descendingHeapsortInPlace();

  print(list);
}
