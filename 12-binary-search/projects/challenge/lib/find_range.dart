// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

class Range {
  Range(this.start, this.end);
  final int start;
  final int end;

  @override
  String toString() => 'Range($start, $end)';
}

Range? findRangeUnoptimized<E>(List<E> list, E value) {
  final start = list.indexOf(value);
  if (start == -1) return null;
  final end = list.lastIndexOf(value) + 1;
  return Range(start, end);
}

Range? findRange<E extends Comparable<dynamic>>(
  List<E> list,
  E value,
) {
  if (list.isEmpty) return null;
  final start = _startIndex(list, value, Range(0, list.length));
  if (start == null) return null;
  final end = _endIndex(list, value, Range(0, list.length));
  return Range(start, end!);
}

int? _startIndex<E extends Comparable<dynamic>>(
  List<E> list,
  E value,
  Range range,
) {
  final size = range.end - range.start;
  final middle = range.start + size ~/ 2;

  if (middle == 0 || middle == list.length - 1) {
    if (list[middle] == value) {
      return middle;
    } else {
      return null;
    }
  }

  if (list[middle] == value && list[middle - 1] != value) {
    return middle;
  } else if (value.compareTo(list[middle]) > 0) {
    return _startIndex(list, value, Range(middle, range.end));
  } else {
    return _startIndex(list, value, Range(range.start, middle));
  }
}

int? _endIndex<E extends Comparable<dynamic>>(
  List<E> list,
  E value,
  Range range,
) {
  final size = range.end - range.start;
  final middle = range.start + size ~/ 2;

  if (middle == 0 || middle == list.length - 1) {
    if (list[middle] == value) {
      return middle + 1;
    } else {
      return null;
    }
  }

  if (list[middle] == value && list[middle + 1] != value) {
    return middle + 1;
  } else if (value.compareTo(list[middle]) < 0) {
    return _endIndex(list, value, Range(range.start, middle));
  } else {
    return _endIndex(list, value, Range(middle, range.end));
  }
}
