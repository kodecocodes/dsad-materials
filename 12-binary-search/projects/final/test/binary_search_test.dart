// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/binary_search.dart';
import 'package:test/test.dart';

void main() {
  group('binarySearch:', () {
    test('empty list', () {
      final list = <int>[];
      expect(list.binarySearch(1), isNull);
    });

    test('normal list', () {
      final list = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150];
      expect(list.binarySearch(1), 0);
      expect(list.binarySearch(5), 1);
      expect(list.binarySearch(15), 2);
      expect(list.binarySearch(17), 3);
      expect(list.binarySearch(19), 4);
      expect(list.binarySearch(22), 5);
      expect(list.binarySearch(24), 6);
      expect(list.binarySearch(31), 7);
      expect(list.binarySearch(105), 8);
      expect(list.binarySearch(150), 9);
      expect(list.binarySearch(-1), isNull);
      expect(list.binarySearch(100), isNull);
    });
  });
}
