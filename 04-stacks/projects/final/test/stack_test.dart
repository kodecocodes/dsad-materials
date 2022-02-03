// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/stack.dart';
import 'package:test/test.dart';

void main() {
  group('Stack:', () {
    test('empty after creation', () {
      final stack = Stack<int>();
      expect(stack.isEmpty, true);
      expect(stack.isNotEmpty, false);
    });

    test('named constructor', () {
      final stack = Stack.of([1, 2]);
      expect(stack.pop(), 2);
      expect(stack.pop(), 1);
    });

    test('push, pop and peek work', () {
      final stack = Stack<int>();
      expect(() => stack.peek, throwsStateError);
      stack.push(1);
      expect(stack.peek, 1);
      expect(stack.isEmpty, false);
      expect(stack.isNotEmpty, true);
      stack.push(2);
      expect(stack.peek, 2);
      var value = stack.pop();
      expect(value, 2);
      expect(stack.peek, 1);
      value = stack.pop();
      expect(value, 1);
      expect(() => stack.peek, throwsStateError);
      expect(() => stack.pop(), throwsRangeError);
    });

    test('toString works', () {
      final stack = Stack<int>();
      expect(stack.toString(), '--- Top ---\n\n-----------');
      stack.push(1);
      stack.push(2);
      expect(stack.toString(), '--- Top ---\n2\n1\n-----------');
    });
  });
}
