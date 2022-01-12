// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:challenge/radix_sort.dart';

void main() {
  challengeOne();
  challengeTwo();
  challengeThree();
}

/// Challenge 1: What are in the buckets?
///
/// Add a `print` statement to your `radixSort` implementation so that it'll
/// tell you what's in the buckets after each round of sorting.
///
/// Do the same for each recursion of `lexicographicalSort`.
///
/// Use the following list for both sorts:
///
/// ```
/// var list = [46, 500, 459, 1345, 13, 999];
/// ```
void challengeOne() {
  // See lib/radix_sort.dart for the code details.
  print('--- LSD-radix sort ---');
  var list = [46, 500, 459, 1345, 13, 999];
  list.radixSort();

  print('--- MSD-radix sort ---');
  list = [46, 500, 459, 1345, 13, 999];
  list.lexicographicalSort();
}

/// Challenge 2: Unique characters
///
/// Write a function that returns the total number of unique characters used
/// in a list of words.
///
/// You can use the following list:
///
/// ```
/// final words = ['done', 'ad', 'eel', 'zoo', 'adept', 'do'];
/// ```
///
/// If you had a bucket for each unique character, how many buckets would
/// you need?
void challengeTwo() {
  final words = ['done', 'ad', 'eel', 'zoo', 'adept', 'do'];
  print(uniqueCharacters(words));
}

int uniqueCharacters(List<String> words) {
  final uniqueChars = <int>{};
  for (final word in words) {
    for (final codeUnit in word.codeUnits) {
      uniqueChars.add(codeUnit);
    }
  }
  return uniqueChars.length;
}

/// Challenge 3: Optimization
///
/// Given the following list:
///
/// [88, 410, 1772, 20, 123456789876543210]
///
/// Your current implementation of `radixSort` would take 18 rounds, 14 of
/// which are completely unnecessary. How could you optimize radix sort
/// for cases where a single number is much larger than the others.
void challengeThree() {
  // Run this code to see the number of rounds that both versions of
  // the algorithm take.
  var list = [88, 410, 1772, 20, 123456789876543210];
  list.unoptimizedRadixSort();
  print(list);

  list = [88, 410, 1772, 20, 123456789876543210];
  list.optimizedRadixSort();
  print(list);
}
