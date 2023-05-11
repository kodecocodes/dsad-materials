// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

void main() {
  exerciseOne();
  exerciseTwo();
  challengeOne();
  challengeTwo();
  challengeThree();
}

/// Exercise 1
///
/// Count by fives to 100. (5, 10, 15, ..., 100)
void exerciseOne() {
  print('countByFivesIteratively');
  countByFivesIteratively();
  print('countByFivesRecursively');
  countByFivesRecursively();
}

void countByFivesIteratively() {
  for (int i = 5; i <= 100; i += 5) {
    print(i);
  }
}

void countByFivesRecursively([int i = 5]) {
  if (i > 100) return;
  print(i);
  countByFivesRecursively(i + 5);
}

/// Exercise 2
///
/// Print all of the square integers from 1 to 100. (1, 4, 9, 16, ..., 100)
void exerciseTwo() {
  printSquaresIteratively();
  printSquaresRecursively();
}

void printSquaresIteratively() {
  int i = 1;
  int square = 1;
  while (square <= 100) {
    print(square);
    i++;
    square = i * i;
  }
}

void printSquaresRecursively([int i = 1]) {
  final square = i * i;
  if (square > 100) return;
  print(square);
  printSquaresRecursively(i + 1);
}

/// Challenge 1: Would You Rather
///
/// Based on the advice at the end of the chapter, would it likely be
/// easier to use iteration or recursion for the following problems:
///
/// 1. Printing all of the file names on your hard drive.
/// 2. Calculating _n_ factorial.
/// 3. Tracking a persons matrilineal line (mother's mother's mother) in a family tree.
/// 4. Parsing JSON.
void challengeOne() {
  // See the Challenge Solutions section of the book for more explanation.
  // 1. recursion
  // 2. iteration
  // 3. iteration
  // 4. recursion
}

/// Challenge 2: How Many
///
/// Using the `Rabbit` class and `family` object you wrote earlier in the
/// chapter, create a function that returns the total number of members in
/// the family.
///
/// The function signature looks like so:
///
/// ```dart
/// int countSize(Rabbit family)
/// ```
void challengeTwo() {
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

  final size = countSize(family);
  print('The family size is: $size');
}

class Rabbit {
  Rabbit(this.name, {this.babies});
  final String name;
  final List<Rabbit>? babies;
}

int countSize(Rabbit family) {
  int count = 1;
  final babies = family.babies;
  if (babies != null) {
    for (final baby in babies) {
      count += countSize(baby);
    }
  }
  return count;
}

/// Challenge 3: Even Faster
///
/// Use memoization to convert your iterative fibonacci function from O(n) to
/// amortized O(1), assuming that the function will be called many times.
void challengeThree() {
  print('  n=50: ${fibonacci(50)}');
  print('  n=20: ${fibonacci(20)}');
  print('  n=92: ${fibonacci(92)}');
  print('  n=51: ${fibonacci(51)}');
  print('  n=5: ${fibonacci(5)}');
  print('  n=91: ${fibonacci(91)}');
  // Note that 7540113804746346429 for n=92 is the highest Fibonacci value
  // a signed 64-bit integer can hold before overflowing.
}

final List<int> _memo = [0, 1, 1];

int fibonacci(int n) {
  if (n < _memo.length) {
    print('Time complexity: O(1)');
    return _memo[n];
  }
  print('Time complexity: O(n)');
  for (int i = _memo.length; i <= n; i++) {
    int temp = _memo[i - 1] + _memo[i - 2];
    _memo.add(temp);
  }
  return _memo[n];
}
