// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/chapter_code.dart';
import 'package:test/test.dart';

void main() {
  group('Chapter 2:', () {
    test('naiveSearch', () {
      const numbers = [1, 3, 56, 66, 68, 80, 99, 105, 450];
      expect(naiveSearch(451, numbers), false);
      expect(naiveSearch(450, numbers), true);
    });

    test('betterSearch', () {
      var list = <int>[];
      expect(betterSearch(1, list), false);
      list = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150];
      expect(betterSearch(1, list), true);
      expect(betterSearch(5, list), true);
      expect(betterSearch(15, list), true);
      expect(betterSearch(17, list), true);
      expect(betterSearch(19, list), true);
      expect(betterSearch(22, list), true);
      expect(betterSearch(24, list), true);
      expect(betterSearch(31, list), true);
      expect(betterSearch(105, list), true);
      expect(betterSearch(150, list), true);
      expect(betterSearch(-1, list), false);
      expect(betterSearch(100, list), false);
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
