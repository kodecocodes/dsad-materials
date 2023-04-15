// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/quicksort.dart';
import 'package:test/test.dart';

void main() {
  group('Quicksort:', () {
    test('Naive', () {
      var list = <int>[];
      list = quicksortNaive(list);
      expect(list, <int>[]);

      list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
      list = quicksortNaive(list);
      expect(list, [-1, 0, 2, 5, 8, 9, 9, 10, 18]);

      list = [8, 2, 2, 8, 9, 5, 9, 2, 8];
      list = quicksortNaive(list);
      expect(list, [2, 2, 2, 5, 8, 8, 8, 9, 9]);
    });

    test('Lomuto', () {
      var list = <int>[];
      quicksortLomuto(list, 0, list.length - 1);
      expect(list, <int>[]);

      list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
      quicksortLomuto(list, 0, list.length - 1);
      expect(list, [-1, 0, 2, 5, 8, 9, 9, 10, 18]);

      list = [8, 2, 2, 8, 9, 5, 9, 2, 8];
      quicksortLomuto(list, 0, list.length - 1);
      expect(list, [2, 2, 2, 5, 8, 8, 8, 9, 9]);
    });

    test('Hoare', () {
      var list = <int>[];
      quicksortHoare(list, 0, list.length - 1);
      expect(list, <int>[]);

      list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
      quicksortHoare(list, 0, list.length - 1);
      expect(list, [-1, 0, 2, 5, 8, 9, 9, 10, 18]);

      list = [8, 2, 2, 8, 9, 5, 9, 2, 8];
      quicksortHoare(list, 0, list.length - 1);
      expect(list, [2, 2, 2, 5, 8, 8, 8, 9, 9]);
    });

    test('Median', () {
      var list = <int>[];
      quicksortMedian(list, 0, list.length - 1);
      expect(list, <int>[]);

      list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
      quicksortMedian(list, 0, list.length - 1);
      expect(list, [-1, 0, 2, 5, 8, 9, 9, 10, 18]);

      list = [8, 2, 2, 8, 9, 5, 9, 2, 8];
      quicksortMedian(list, 0, list.length - 1);
      expect(list, [2, 2, 2, 5, 8, 8, 8, 9, 9]);
    });

    test('Dutch flag', () {
      var list = <int>[];
      quicksortDutchFlag(list, 0, list.length - 1);
      expect(list, <int>[]);

      list = [8, 2, 10, 0, 9, 18, 9, -1, 5];
      quicksortDutchFlag(list, 0, list.length - 1);
      expect(list, [-1, 0, 2, 5, 8, 9, 9, 10, 18]);

      list = [8, 2, 2, 8, 9, 5, 9, 2, 8];
      quicksortDutchFlag(list, 0, list.length - 1);
      expect(list, [2, 2, 2, 5, 8, 8, 8, 9, 9]);
    });
  });
}
