// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:challenge/heapsort.dart';
import 'package:challenge/heapsort_ascending.dart';
import 'package:test/test.dart';

void main() {
  group('Challenge 2:', () {
    test('using reversed', () {
      final list = [6, 12, 2, 26, 8, 18, 21, 9, 5];
      final ascending = heapsort(list);
      expect(list, [6, 12, 2, 26, 8, 18, 21, 9, 5]);
      expect(ascending, [2, 5, 6, 8, 9, 12, 18, 21, 26]);
      final descending = ascending.reversed;
      expect(descending, [26, 21, 18, 12, 9, 8, 6, 5, 2]);
    });

    test('reimplementing heapsort', () {
      final list = [6, 12, 2, 26, 8, 18, 21, 9, 5];
      final sorted = descendingHeapsort(list);
      expect(list, [6, 12, 2, 26, 8, 18, 21, 9, 5]);
      expect(sorted, [26, 21, 18, 12, 9, 8, 6, 5, 2]);
    });

    test('reimplementing heapsortInPlace', () {
      final list = [6, 12, 2, 26, 8, 18, 21, 9, 5];
      list.descendingHeapsortInPlace();
      expect(list, [26, 21, 18, 12, 9, 8, 6, 5, 2]);
    });
  });
}
