// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:challenge/stack.dart';

void main() {
  challengeOne();
  challengeTwo();
}

/// Challenge 1: Reverse a List
///
/// Create a function that prints the contents of a list in reverse order.
void challengeOne() {
  const list = ['d', 'r', 'a', 'w', 'e', 'r'];
  printInReverse(list);

  print(list.reversed);
}

void printInReverse<E>(List<E> list) {
  var stack = Stack<E>();

  for (E value in list) {
    stack.push(value);
  }

  while (stack.isNotEmpty) {
    print(stack.pop());
  }
}

/// Challenge 2: Balance the parentheses
///
/// Check for balanced parentheses. Given a string, check if there are `(`
/// and `)` characters, and return `true` if the parentheses in the string
/// are balanced. For example:
///
/// h((e))llo(world)()  // balanced parentheses
/// (hello world        // unbalanced parentheses
void challengeTwo() {
  print(checkParentheses('h((e))llo(world)()'));
  print(checkParentheses('(hello world'));
  print(checkParentheses('hello)(world'));
}

bool checkParentheses(String text) {
  var stack = Stack<int>();

  final open = '('.codeUnitAt(0);
  final close = ')'.codeUnitAt(0);

  for (int codeUnit in text.codeUnits) {
    if (codeUnit == open) {
      stack.push(codeUnit);
    } else if (codeUnit == close) {
      if (stack.isEmpty) {
        return false;
      } else {
        stack.pop();
      }
    }
  }
  return stack.isEmpty;
}
