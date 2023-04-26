// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/quicksort.dart';
import 'package:test/test.dart';

void main() {
  test('Challenge One', () {
    final list = <num>[8, 2, 10, 0, 9, 18, 9, -1, 5];
    quicksortIterativeLomuto(list);
    expect(list, [-1, 0, 2, 5, 8, 9, 9, 10, 18]);
  });
}
