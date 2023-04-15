// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/chapter_code.dart';
import 'package:test/test.dart';

void main() {
  group('Chapter 2:', () {
    test('naiveContains', () {
      const numbers = [1, 3, 56, 66, 68, 80, 99, 105, 450];
      expect(naiveContains(451, numbers), false);
      expect(naiveContains(450, numbers), true);
    });

    test('betterNaiveContains', () {
      const numbers = [1, 3, 56, 66, 68, 80, 99, 105, 450];
      expect(betterNaiveContains(451, numbers), false);
      expect(betterNaiveContains(450, numbers), true);
      expect(betterNaiveContains(66, numbers), true);
    });

    test('sumFromOneTo', () {
      expect(sumFromOneTo(3), 6);
    });

    test('betterSumFromOneTo', () {
      expect(betterSumFromOneTo(3), 6);
    });

    test('multiply', () {
      expect(multiply(3, 5), 15);
    });

    test('fillList', () {
      expect(fillList(5), ['a', 'a', 'a', 'a', 'a']);
    });

    test('stuffList', () {
      expect(stuffList(5), ['aaaaa', 'aaaaa', 'aaaaa', 'aaaaa', 'aaaaa']);
    });
  });
}
