// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

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

bool naiveSearch(int value, List<int> list) {
  for (final element in list) {
    if (element == value) return true;
  }
  return false;
}

bool betterSearch(int value, List<int> list) {
  int start = 0;
  int end = list.length;

  while (start < end) {
    final size = end - start;
    int middle = start + size ~/ 2;

    if (list[middle] == value) {
      return true;
    } else if (list[middle] < value) {
      start = middle + 1;
    } else {
      end = middle;
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
