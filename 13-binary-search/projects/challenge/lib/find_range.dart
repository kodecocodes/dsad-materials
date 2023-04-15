// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

class Range {
  Range(this.start, this.end);
  final int start;
  final int end;

  @override
  String toString() => 'Range($start, $end)';
}

Range? findRangeUnoptimized(List<int> list, int value) {
  final start = list.indexOf(value);
  if (start == -1) return null;
  final end = list.lastIndexOf(value) + 1;
  return Range(start, end);
}

Range? findRange(List<int> list, int value) {
  if (list.isEmpty) return null;
  final start = _startIndex(list, value);
  final end = _endIndex(list, value);
  if (start == null || end == null) return null;
  return Range(start, end);
}

int? _startIndex(List<int> list, int value) {
  if (list[0] == value) return 0;
  var start = 1;
  var end = list.length;
  while (start < end) {
    var middle = start + (end - start) ~/ 2;
    if (list[middle] == value && list[middle - 1] != value) {
      return middle;
    } else if (list[middle] < value) {
      start = middle + 1;
    } else {
      end = middle;
    }
  }
  return null;
}

int? _endIndex(List<int> list, int value) {
  if (list[list.length - 1] == value) return list.length;
  var start = 0;
  var end = list.length - 1;
  while (start < end) {
    var middle = start + (end - start) ~/ 2;
    if (list[middle] == value && list[middle + 1] != value) {
      return middle + 1;
    } else if (list[middle] > value) {
      end = middle;
    } else {
      start = middle + 1;
    }
  }
  return null;
}
