// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/find_range.dart';

void main() {
  challengeOne();
  challengeTwo();
  challengeThree();
}

/// Challenge 1: Binary search as a free function
///
/// In this chapter, you implemented binary search as an extension
/// of `List`. Since binary search only works on sorted lists, exposing
/// `binarySearch` for every list (including unsorted ones) opens it up
/// to being misused.
///
/// Your challenge is to implement binary search as a free function.
void challengeOne() {
  int? binarySearch<E extends Comparable<dynamic>>(
    List<E> list,
    E value, [
    int? start,
    int? end,
  ]) {
    final startIndex = start ?? 0;
    final endIndex = end ?? list.length;
    if (startIndex >= endIndex) {
      return null;
    }
    final size = endIndex - startIndex;
    final middle = startIndex + size ~/ 2;
    if (list[middle] == value) {
      return middle;
    } else if (value.compareTo(list[middle]) < 0) {
      return binarySearch(list, value, startIndex, middle);
    } else {
      return binarySearch(list, value, middle + 1, endIndex);
    }
  }

  final list = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150];
  final index = binarySearch(list, 31);
  print('Found at index $index');
}

/// Challenge 2: Non-recursive search
///
/// Does recursion make your brain hurt? No worries, you can always perform
/// the same task in a non-recursive way. Re-implement `binarySearch` using
/// a `while` loop.
void challengeTwo() {
  int? binarySearch<E extends Comparable<dynamic>>(
    List<E> list,
    E value,
  ) {
    var start = 0;
    var end = list.length;
    while (start < end) {
      final middle = start + (end - start) ~/ 2;
      if (value == list[middle]) {
        return middle;
      } else if (value.compareTo(list[middle]) < 0) {
        end = middle;
      } else {
        start = middle + 1;
      }
    }
    return null;
  }

  final list = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150];
  final index = binarySearch(list, 31);
  print('Found at index $index');
}

/// Challenge 3: Searching for a range
///
/// Write a function that searches a sorted list and finds the range of
/// indices for a particular element. You can start by creating a class
/// named `Range` that holds the start and end indices.
///
/// For example:
///
/// ```
/// final list = [1, 2, 3, 3, 3, 4, 5, 5];
/// final range = findRange(list, value: 3);
/// ```
///
/// `findRange` should return `Range(2, 5)` since those are the start and
/// end indices for the value `3`.
void challengeThree() {
  // See lib/find_range.dart for implementation details.
  final list = [1, 2, 3, 3, 3, 4, 5, 5];
  var range = findRangeUnoptimized(list, 3);
  print(range);

  range = findRange(list, 3);
  print(range);
  // See test/find_range_test.dart for more usage examples.
}
