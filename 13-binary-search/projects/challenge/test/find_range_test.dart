// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/find_range.dart';
import 'package:test/test.dart';

void main() {
  group('findRange:', () {
    test('empty list', () {
      final list = <int>[];
      final range = findRange(list, 3);
      expect(range, isNull);
    });

    test('not in list', () {
      final list = [1, 3, 3, 3, 4];
      final range = findRange(list, 5);
      expect(range, isNull);
    });

    test('middle of list', () {
      final list = [1, 3, 3, 3, 4];
      final range = findRange(list, 3);
      expect(range!.start, 1);
      expect(range.end, 4);
    });

    test('beginning of list', () {
      final list = [3, 3, 3, 4];
      final range = findRange(list, 3);
      expect(range!.start, 0);
      expect(range.end, 3);
    });

    test('end of list', () {
      final list = [1, 3, 3, 3];
      final range = findRange(list, 3);
      expect(range!.start, 1);
      expect(range.end, 4);
    });

    test('whole list', () {
      final list = [3, 3, 3];
      final range = findRange(list, 3);
      expect(range!.start, 0);
      expect(range.end, 3);
    });

    test('single value in middle of list', () {
      final list = [1, 3, 4];
      final range = findRange(list, 3);
      expect(range!.start, 1);
      expect(range.end, 2);
    });

    test('single value in list', () {
      final list = [3];
      final range = findRange(list, 3);
      expect(range!.start, 0);
      expect(range.end, 1);
    });

    // https://forums.raywenderlich.com/t/errata-for-data-structures-algorithms-in-kotlin-2nd-edition/143193/3
    test('handles empty range', () {
      final list = [0, 1, 3, 3];
      final range = findRange(list, 2);
      expect(range, null);
    });

    // https://forums.raywenderlich.com/t/errata-for-data-structures-algorithms-in-kotlin-2nd-edition/143193/3
    test('handles finding first item in list of length 2', () {
      final list = [0, 1];
      final range = findRange(list, 0);
      expect(range!.start, 0);
      expect(range.end, 1);
    });
  });
}
