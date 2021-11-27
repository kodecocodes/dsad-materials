// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/heapsort.dart';
import 'package:test/test.dart';

void main() {
  group('heapsort:', () {
    test('original list not changed', () {
      final list = [1, 3, 2];
      final sorted = heapsort(list);
      expect(list, [1, 3, 2]);
      expect(sorted, [1, 2, 3]);
    });

    test('sorts list - chapter example', () {
      final list = [6, 12, 2, 26, 8, 18, 21, 9, 5];
      final sorted = heapsort(list);
      expect(sorted, [2, 5, 6, 8, 9, 12, 18, 21, 26]);
    });

    test('sorts list - challenge examples', () {
      var list = [1, 2, 3, 4, 5];
      var sorted = heapsort(list);
      expect(sorted, [1, 2, 3, 4, 5]);
      list = [5, 4, 3, 2, 1];
      sorted = heapsort(list);
      expect(sorted, [1, 2, 3, 4, 5]);
    });

    test('empty list', () {
      final list = <int>[];
      final sorted = heapsort(list);
      expect(sorted, <int>[]);
    });
  });

  group('heapsortInPlace', () {
    test('original list changed', () {
      final list = [1, 3, 2];
      list.heapsortInPlace();
      expect(list, [1, 2, 3]);
    });

    test('sorts list - chapter example', () {
      final list = [6, 12, 2, 26, 8, 18, 21, 9, 5];
      list.heapsortInPlace();
      expect(list, [2, 5, 6, 8, 9, 12, 18, 21, 26]);
    });

    test('sorts list - challenge examples', () {
      var list = [1, 2, 3, 4, 5];
      list.heapsortInPlace();
      expect(list, [1, 2, 3, 4, 5]);
      list = [5, 4, 3, 2, 1];
      list.heapsortInPlace();
      expect(list, [1, 2, 3, 4, 5]);
    });

    test('empty list', () {
      final list = <int>[];
      list.heapsortInPlace();
      expect(list, <int>[]);
    });
  });
}
