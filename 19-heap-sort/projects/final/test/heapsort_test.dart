// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/heap.dart';
import 'package:final_project/heapsort.dart';
import 'package:test/test.dart';

void main() {
  group('Heap', () {
    test('produces order shown in example image', () {
      final heap = Heap(elements: <num>[6, 12, 2, 26, 8, 18, 21, 9, 5]);
      expect(heap.elements, [26, 12, 21, 9, 8, 18, 2, 6, 5]);
    });
  });

  group('heapsort:', () {
    test('original list not changed', () {
      final list = <num>[1, 3, 2];
      final sorted = heapsort(list);
      expect(list, [1, 3, 2]);
      expect(sorted, [1, 2, 3]);
    });

    test('sorts list - chapter example', () {
      final list = <num>[6, 12, 2, 26, 8, 18, 21, 9, 5];
      final sorted = heapsort(list);
      expect(sorted, [2, 5, 6, 8, 9, 12, 18, 21, 26]);
    });

    test('sorts list - challenge examples', () {
      var list = <num>[1, 2, 3, 4, 5];
      var sorted = heapsort(list);
      expect(sorted, [1, 2, 3, 4, 5]);
      list = [5, 4, 3, 2, 1];
      sorted = heapsort(list);
      expect(sorted, [1, 2, 3, 4, 5]);
    });

    test('empty list', () {
      final list = <num>[];
      final sorted = heapsort(list);
      expect(sorted, <int>[]);
    });
  });

  group('heapsortInPlace', () {
    test('original list changed', () {
      final list = <num>[1, 3, 2];
      list.heapsortInPlace();
      expect(list, [1, 2, 3]);
    });

    test('sorts list - chapter example', () {
      final list = <num>[6, 12, 2, 26, 8, 18, 21, 9, 5];
      list.heapsortInPlace();
      expect(list, [2, 5, 6, 8, 9, 12, 18, 21, 26]);
    });

    test('sorts list - challenge examples', () {
      var list = <num>[1, 2, 3, 4, 5];
      list.heapsortInPlace();
      expect(list, [1, 2, 3, 4, 5]);
      list = [5, 4, 3, 2, 1];
      list.heapsortInPlace();
      expect(list, [1, 2, 3, 4, 5]);
    });

    test('empty list', () {
      final list = <num>[];
      list.heapsortInPlace();
      expect(list, <int>[]);
    });
  });
}
