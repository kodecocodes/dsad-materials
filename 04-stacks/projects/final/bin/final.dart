// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/stack.dart';

void main() {
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  print(stack);

  final element = stack.pop();
  print('Popped: $element');

  print(stack.peek);
  print(stack.isEmpty);
  print(stack.isNotEmpty);

  const list = ['S', 'M', 'O', 'K', 'E'];
  final smokeStack = Stack.of(list);
  print(smokeStack);
  print('Popped: ${smokeStack.pop()}');
}
