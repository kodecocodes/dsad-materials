// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

void main() {
  ///////////////////////
  /// Time complexity ///
  ///////////////////////

  // Constant time
  const names = ['Edith', 'Megan', 'Pablo'];
  checkFirst(names);

  // Linear time
  printNames(names);

  // Quadratic time
  printMoreNames(names);

  // Logarithmic time
  const numbers = [1, 3, 56, 66, 68, 80, 99, 105, 450];
  var exists = naiveContains(451, numbers);
  print(exists);
  exists = betterNaiveContains(451, numbers);
  print(exists);

  // Comparing time complexity
  final start = DateTime.now();
  final sum = sumFromOneTo(10000);
  final end = DateTime.now();
  final time = end.difference(start);
  print(sum);
  print(time);
  final start2 = DateTime.now();
  final sum2 = betterSumFromOneTo(10000);
  final end2 = DateTime.now();
  final time2 = end2.difference(start2);
  print(sum2);
  print(time2);

  ////////////////////////
  /// Space complexity ///
  ////////////////////////

  // Constant space
  print(multiply(3, 5));

  // Linear space
  print(fillList(5));

  // Quadratic space
  print(stuffList(5));
}

void checkFirst(List<String> names) {
  if (names.isNotEmpty) {
    print(names.first);
  } else {
    print('no names');
  }
}

void printNames(List<String> names) {
  for (final name in names) {
    print(name);
  }
}

void printMoreNames(List<String> names) {
  for (final _ in names) {
    for (final name in names) {
      print(name);
    }
  }
}

bool naiveContains(int value, List<int> list) {
  for (final element in list) {
    if (element == value) return true;
  }
  return false;
}

bool betterNaiveContains(int value, List<int> list) {
  if (list.isEmpty) return false;
  final middleIndex = list.length ~/ 2;

  if (value > middleIndex) {
    for (var i = middleIndex; i < list.length; i++) {
      if (list[i] == value) return true;
    }
  } else {
    for (var i = middleIndex; i >= 0; i--) {
      if (list[i] == value) return true;
    }
  }

  return false;
}

int sumFromOneTo(int n) {
  var sum = 0;
  for (var i = 1; i <= n; i++) {
    sum += i;
  }
  return sum;
}

int betterSumFromOneTo(int n) {
  return n * (n + 1) ~/ 2;
}

int multiply(int a, int b) {
  return a * b;
}

List<String> fillList(int length) {
  return List.filled(length, 'a');
}

List<String> stuffList(int length) {
  return List.filled(length, 'a' * length);
}
