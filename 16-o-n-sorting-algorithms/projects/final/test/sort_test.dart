// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/bubble_sort.dart';
import 'package:final_project/insertion_sort.dart';
import 'package:final_project/selection_sort.dart';
import 'package:final_project/swap.dart';
import 'package:test/test.dart';

void main() {
  group('Swap extension:', () {
    test('swaps two elements', () {
      final list = [1, 2];
      list.swap(0, 1);
      expect(list, [2, 1]);
    });
  });

  group('Bubble sort:', () {
    test('empty list', () {
      final list = <num>[];
      bubbleSort(list);
      expect(list, <num>[]);
    });

    test('chapter example', () {
      final list = <num>[9, 4, 10, 3];
      bubbleSort(list);
      expect(list, [3, 4, 9, 10]);
    });

    test('challenge example', () {
      final list = <num>[4, 2, 5, 1, 3];
      bubbleSort(list);
      expect(list, [1, 2, 3, 4, 5]);
    });
  });

  group('Selection sort:', () {
    test('empty list', () {
      final list = <num>[];
      selectionSort(list);
      expect(list, <num>[]);
    });

    test('chapter example', () {
      final list = <num>[9, 4, 10, 3];
      selectionSort(list);
      expect(list, [3, 4, 9, 10]);
    });

    test('challenge example', () {
      final list = <num>[4, 2, 5, 1, 3];
      selectionSort(list);
      expect(list, [1, 2, 3, 4, 5]);
    });
  });

  group('Insertion sort:', () {
    test('empty list', () {
      final list = <num>[];
      insertionSort(list);
      expect(list, <num>[]);
    });

    test('chapter example', () {
      final list = <num>[9, 4, 10, 3];
      insertionSort(list);
      expect(list, [3, 4, 9, 10]);
    });

    test('challenge example', () {
      final list = <num>[4, 2, 5, 1, 3];
      insertionSort(list);
      expect(list, [1, 2, 3, 4, 5]);
    });
  });
}
