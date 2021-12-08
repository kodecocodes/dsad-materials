// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/heap.dart';
import 'package:test/test.dart';

void main() {
  group('Max heap:', () {
    test('basic getters', () {
      final heap = Heap<int>();
      expect(heap.isEmpty, true);
      expect(heap.peek, null);
      expect(heap.size, 0);

      heap.insert(10);
      heap.insert(5);
      expect(heap.isEmpty, false);
      expect(heap.peek, 10);
      expect(heap.size, 2);
    });

    test('inserting in natural order (no sifting required)', () {
      final heap = Heap<int>();
      heap.insert(10);
      expect(heap.elements, [10]);
      heap.insert(8);
      expect(heap.elements, [10, 8]);
      heap.insert(4);
      expect(heap.elements, [10, 8, 4]);
      heap.insert(7);
      expect(heap.elements, [10, 8, 4, 7]);
      heap.insert(1);
      expect(heap.elements, [10, 8, 4, 7, 1]);
      heap.insert(2);
      expect(heap.elements, [10, 8, 4, 7, 1, 2]);
      heap.insert(3);
      expect(heap.elements, [10, 8, 4, 7, 1, 2, 3]);
      heap.insert(5);
      expect(heap.elements, [10, 8, 4, 7, 1, 2, 3, 5]);
    });

    test('inserting that requires sifting', () {
      final heap = Heap<int>();
      heap.insert(8);
      expect(heap.elements, [8]);
      heap.insert(10);
      expect(heap.elements, [10, 8]);
      heap.insert(3);
      expect(heap.elements, [10, 8, 3]);
      heap.insert(5);
      expect(heap.elements, [10, 8, 3, 5]);
      heap.insert(1);
      expect(heap.elements, [10, 8, 3, 5, 1]);
      heap.insert(2);
      expect(heap.elements, [10, 8, 3, 5, 1, 2]);
      heap.insert(4);
      expect(heap.elements, [10, 8, 4, 5, 1, 2, 3]);
      heap.insert(7);
      expect(heap.elements, [10, 8, 4, 7, 1, 2, 3, 5]);
    });

    test('Constructor sorts heap', () {
      var heap = Heap<int>(elements: [10, 8, 4, 7, 1, 2, 3, 5]);
      expect(heap.elements, [10, 8, 4, 7, 1, 2, 3, 5]);
      heap = Heap<int>(elements: [8, 10, 3, 5, 1, 2, 4, 7]);
      expect(heap.elements, [10, 8, 4, 7, 1, 2, 3, 5]);
    });

    test('removing from max heap returns higher value', () {
      final heap = Heap<int>();
      heap.insert(10);
      heap.insert(8);
      heap.insert(5);
      heap.insert(4);
      heap.insert(6);
      heap.insert(2);
      heap.insert(1);
      heap.insert(3);
      expect(heap.elements, [10, 8, 5, 4, 6, 2, 1, 3]);

      var value = heap.remove();
      expect(value, 10);
      expect(heap.elements, [8, 6, 5, 4, 3, 2, 1]);

      value = heap.remove();
      expect(value, 8);
      expect(heap.elements, [6, 4, 5, 1, 3, 2]);

      value = heap.remove();
      expect(value, 6);
      expect(heap.elements, [5, 4, 2, 1, 3]);

      value = heap.remove();
      expect(value, 5);
      expect(heap.elements, [4, 3, 2, 1]);

      value = heap.remove();
      expect(value, 4);
      expect(heap.elements, [3, 1, 2]);

      value = heap.remove();
      expect(value, 3);
      expect(heap.elements, [2, 1]);

      value = heap.remove();
      expect(value, 2);
      expect(heap.elements, [1]);

      value = heap.remove();
      expect(value, 1);
      expect(heap.elements, <int>[]);

      value = heap.remove();
      expect(value, isNull);
      expect(heap.elements, <int>[]);
    });

    test('indexOf in empty heap', () {
      final heap = Heap<int>();
      var index = heap.indexOf(10);
      expect(index, -1);
    });

    test('indexOf returns index of value', () {
      final heap = Heap<int>(elements: [10, 8, 4, 7, 1, 2, 3, 5]);
      var index = heap.indexOf(10);
      expect(index, 0);
      index = heap.indexOf(8);
      expect(index, 1);
      index = heap.indexOf(4);
      expect(index, 2);
      index = heap.indexOf(7);
      expect(index, 3);
      index = heap.indexOf(1);
      expect(index, 4);
      index = heap.indexOf(2);
      expect(index, 5);
      index = heap.indexOf(3);
      expect(index, 6);
      index = heap.indexOf(5);
      expect(index, 7);
      index = heap.indexOf(999);
      expect(index, -1);
    });

    test('indexOf with min index', () {
      final heap = Heap<int>(elements: [10, 10, 4, 7, 1, 2, 3, 5]);
      var index = heap.indexOf(10, index: 0);
      expect(index, 0);
      index = heap.indexOf(10, index: 1);
      expect(index, 1);
      index = heap.indexOf(10, index: 2);
      expect(index, -1);
    });
  });

  group('Min heap:', () {
    test('inserting in natural order (no sifting required)', () {
      final heap = Heap<int>(priority: Priority.min);
      heap.insert(1);
      expect(heap.elements, [1]);
      heap.insert(3);
      expect(heap.elements, [1, 3]);
      heap.insert(2);
      expect(heap.elements, [1, 3, 2]);
      heap.insert(8);
      expect(heap.elements, [1, 3, 2, 8]);
    });

    test('inserting that requires sifting', () {
      final heap = Heap<int>(priority: Priority.min);
      heap.insert(8);
      expect(heap.elements, [8]);
      heap.insert(2);
      expect(heap.elements, [2, 8]);
      heap.insert(1);
      expect(heap.elements, [1, 8, 2]);
      heap.insert(3);
      expect(heap.elements, [1, 3, 2, 8]);
    });

    test('Constructor sorts heap', () {
      var heap = Heap<int>(
        elements: [1, 3, 2, 8],
        priority: Priority.min,
      );
      expect(heap.elements, [1, 3, 2, 8]);
      heap = Heap<int>(
        elements: [8, 2, 1, 3],
        priority: Priority.min,
      );
      expect(heap.elements, [1, 2, 8, 3]);
    });

    test('removing from min heap returns lower value', () {
      var heap = Heap<int>(
        elements: [1, 3, 2, 8],
        priority: Priority.min,
      );

      var value = heap.remove();
      expect(value, 1);
      expect(heap.elements, [2, 3, 8]);

      value = heap.remove();
      expect(value, 2);
      expect(heap.elements, [3, 8]);

      value = heap.remove();
      expect(value, 3);
      expect(heap.elements, [8]);

      value = heap.remove();
      expect(value, 8);
      expect(heap.elements, <int>[]);

      value = heap.remove();
      expect(value, isNull);
      expect(heap.elements, <int>[]);
    });

    test('indexOf in empty heap', () {
      final heap = Heap<int>(priority: Priority.min);
      var index = heap.indexOf(10);
      expect(index, -1);
    });

    test('indexOf returns index of value', () {
      final heap = Heap<int>(
        elements: [1, 3, 2, 8],
        priority: Priority.min,
      );
      var index = heap.indexOf(1);
      expect(index, 0);
      index = heap.indexOf(3);
      expect(index, 1);
      index = heap.indexOf(2);
      expect(index, 2);
      index = heap.indexOf(8);
      expect(index, 3);
      index = heap.indexOf(999);
      expect(index, -1);
    });

    test('indexOf with min index', () {
      final heap = Heap<int>(
        elements: [1, 1, 2, 8],
        priority: Priority.min,
      );
      var index = heap.indexOf(1, index: 0);
      expect(index, 0);
      index = heap.indexOf(1, index: 1);
      expect(index, 1);
      index = heap.indexOf(1, index: 2);
      expect(index, -1);
    });
  });
}
