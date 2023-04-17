// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/chapter_code.dart';

void main() {
  ///////////////////////
  /// Time complexity ///
  ///////////////////////

  // Constant time
  const names = ['Edith', 'Megan', 'Pablo'];
  checkFirst(names);

  // Linear time
  printNames(names);

  // Quadratic time
  printMoreNames(names);

  // Logarithmic time
  const numbers = [1, 3, 56, 66, 68, 80, 99, 105, 450];
  var exists = naiveSearch(451, numbers);
  print(exists);
  exists = betterSearch(451, numbers);
  print(exists);

  // Comparing time complexity
  final start = DateTime.now();
  final sum = sumFromOneTo(10000);
  final end = DateTime.now();
  final time = end.difference(start);
  print(sum);
  print(time);

  final start2 = DateTime.now();
  final sum2 = betterSumFromOneTo(10000);
  final end2 = DateTime.now();
  final time2 = end2.difference(start2);
  print(sum2);
  print(time2);

  ////////////////////////
  /// Space complexity ///
  ////////////////////////

  // Constant space
  print(multiply(3, 5));

  // Linear space
  print(fillList(5));

  // Quadratic space
  print(stuffList(5));
}
