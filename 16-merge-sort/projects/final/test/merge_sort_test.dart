// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/merge_sort.dart';
import 'package:test/test.dart';

void main() {
  group('mergeSort:', () {
    test('empty', () {
      final result = mergeSort<int>([]);
      expect(result, <int>[]);
    });

    test('single', () {
      final result = mergeSort([1]);
      expect(result, [1]);
    });

    test('double same', () {
      final result = mergeSort([2, 2]);
      expect(result, [2, 2]);
    });

    test('double sorted', () {
      final result = mergeSort([1, 2]);
      expect(result, [1, 2]);
    });

    test('double unsorted', () {
      final result = mergeSort([2, 1]);
      expect(result, [1, 2]);
    });

    test('chapter example', () {
      final result = mergeSort([7, 2, 6, 3, 9]);
      expect(result, [2, 3, 6, 7, 9]);
    });

    test('challenge example', () {
      final result = mergeSort([4, 2, 5, 1, 3]);
      expect(result, [1, 2, 3, 4, 5]);
    });
  });
}
