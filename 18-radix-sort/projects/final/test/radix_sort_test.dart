// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/radix_sort.dart';
import 'package:test/test.dart';

void main() {
  group('int extensions:', () {
    test('digits', () {
      expect(1.digits(), 1);
      expect(10.digits(), 2);
      expect(100.digits(), 3);
    });

    test('digitAt', () {
      expect(1234.digitAt(0), 1);
      expect(1234.digitAt(1), 2);
      expect(1234.digitAt(2), 3);
      expect(1234.digitAt(3), 4);
      expect(1234.digitAt(4), isNull);
    });
  });

  group('List extentions:', () {
    test('maxDigits', () {
      final list = [1, 10, 100, 1000, 10];
      expect(list.maxDigits(), 4);
    });

    test('maxDigits with empty list', () {
      final list = <int>[];
      expect(list.maxDigits(), 0);
    });

    test('radixSort', () {
      final list = [88, 410, 1772, 20];
      list.radixSort();
      expect(list, [20, 88, 410, 1772]);
    });

    test('radixSort with empty list', () {
      final list = <int>[];
      list.radixSort();
      expect(list, <int>[]);
    });

    test('lexicographicalSort', () {
      final list = [46, 500, 459, 1345, 13, 999];
      list.lexicographicalSort();
      expect(list, [13, 1345, 459, 46, 500, 999]);
    });

    test('lexicographicalSort with empty list', () {
      final list = <int>[];
      list.lexicographicalSort();
      expect(list, <int>[]);
    });
  });
}
