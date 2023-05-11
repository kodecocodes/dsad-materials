// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/stack.dart';

void main() {
  recursionInComputing();
  whenRecursionIsUseful();
  whenNotToUseRecursion();
}

void recursionInComputing() {
  // tellJoke();
  // tellJokeIteratively();
  breakingOutOfWhileLoopExample();
  countToTenRecursively();
}

void tellJoke() {
  print("Pete and Repeat were in a boat. Pete fell out. Who's left?");
  print('Repeat');
  tellJoke();
}

void tellJokeIteratively() {
  while (true) {
    print("Pete and Repeat were in a boat. Pete fell out. Who's left?");
    print('Repeat');
  }
}

void breakingOutOfWhileLoopExample() {
  int i = 0;
  while (true) {
    print('Knock knock');
    print("Who's there?");
    if (i == 5) break;
    print('Banana');
    print('Banana who?');
    i++;
  }
  print('Orange');
  print('Orange who?');
  print("Orange you glad I didn't say banana again?");
}

void countToTenRecursively([int i = 1]) {
  if (i > 10) return;
  print('$i Mississippi');
  // await Future.delayed(Duration(seconds: 1));
  countToTenRecursively(i + 1);
}

void whenRecursionIsUseful() {
  final family = Rabbit(
    'Mommy',
    babies: [
      Rabbit(
        'Hoppy',
        babies: [
          Rabbit('Bunny'),
          Rabbit('Honey'),
          Rabbit('Sunny'),
        ],
      ),
      Rabbit(
        'Floppy',
        babies: [
          Rabbit('Doozy'),
          Rabbit('Woozy'),
        ],
      ),
      Rabbit(
        'Moppy',
        babies: [
          Rabbit('Nosey'),
          Rabbit('Mosey'),
          Rabbit('Toesy'),
          Rabbit('Rosey'),
        ],
      ),
    ],
  );

  printName(family);
  printNamesIteratively(family);
}

class Rabbit {
  Rabbit(this.name, {this.babies});
  final String name;
  final List<Rabbit>? babies;
}

void printName(Rabbit rabbit) {
  // 1
  print(rabbit.name);
  // 2
  final babies = rabbit.babies;
  if (babies == null) return;
  // 3
  for (final baby in babies) {
    printName(baby);
  }
}

void printNamesIteratively(Rabbit rabbit) {
  final stack = Stack<Rabbit>();
  stack.push(rabbit);

  while (stack.isNotEmpty) {
    Rabbit current = stack.pop();
    print(current.name);

    final babies = current.babies;
    if (babies == null) continue;

    for (final baby in babies.reversed) {
      stack.push(baby);
    }
  }
}

void whenNotToUseRecursion() {
  var value = fibonacci(5);
  print('value: $value');

  value = memoizedFibonacci(5);
  print('value: $value');

  value = iterativeFibonacci(5);
  print('value: $value');
}

int fibonacci(int n) {
  print('fibonacci($n)');
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

int memoizedFibonacci(int n, [Map<int, int>? memo]) {
  print('memoizedFibonacci($n)');
  memo ??= {};
  if (n <= 1) return n;
  if (!memo.containsKey(n)) {
    memo[n] = memoizedFibonacci(n - 1, memo) + memoizedFibonacci(n - 2, memo);
  }
  return memo[n]!;
}

int iterativeFibonacci(int n) {
  if (n <= 1) return n;

  int first = 1;
  int second = 1;

  for (int i = 3; i <= n; i++) {
    int temp = first + second;
    first = second;
    second = temp;
  }

  return second;
}
