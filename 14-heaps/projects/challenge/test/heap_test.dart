// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/heap.dart';
import 'package:test/test.dart';

void main() {
  group('Heap:', () {
    test('merge', () {
      final listA = [21, 10, 18, 5, 3, 100, 1];
      final listB = [30, 9, 4, 2, 70, 99];
      final heap = Heap<num>(elements: listA);
      heap.merge(listB);
      expect(heap.elements, [100, 30, 99, 10, 4, 70, 1, 5, 9, 3, 2, 21, 18]);
    });
  });
}
