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
  int left = 0;
  int right = list.length - 1;

  while (left <= right) {
    final size = right - left;
    int middle = left + size ~/ 2;

    if (list[middle] == value) {
      return true;
    } else if (list[middle] < value) {
      left = middle + 1;
    } else {
      right = middle - 1;
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
