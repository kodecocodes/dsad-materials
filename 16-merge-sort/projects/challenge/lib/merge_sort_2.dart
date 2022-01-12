List<E> mergeSort<E extends Comparable<dynamic>>(List<E> list) {
  if (list.length < 2) return list;

  final middle = list.length ~/ 2;
  final left = mergeSort(list.sublist(0, middle));
  final right = mergeSort(list.sublist(middle));

  return _merge(left, right);
}

List<E> _merge<E extends Comparable<dynamic>>(
  Iterable<E> first,
  Iterable<E> second,
) {
  var result = <E>[];

  var firstIterator = first.iterator;
  var secondIterator = second.iterator;

  var firstHasValue = firstIterator.moveNext();
  var secondHasValue = secondIterator.moveNext();

  while (firstHasValue && secondHasValue) {
    final firstValue = firstIterator.current;
    final secondValue = secondIterator.current;

    if (firstValue.compareTo(secondValue) < 0) {
      result.add(firstValue);
      firstHasValue = firstIterator.moveNext();
    } else if (firstValue.compareTo(secondValue) > 0) {
      result.add(secondValue);
      secondHasValue = secondIterator.moveNext();
    } else {
      result.add(firstValue);
      result.add(secondValue);
      firstHasValue = firstIterator.moveNext();
      secondHasValue = secondIterator.moveNext();
    }
  }

  if (firstHasValue) {
    do {
      result.add(firstIterator.current);
    } while (firstIterator.moveNext());
  }

  if (secondHasValue) {
    do {
      result.add(secondIterator.current);
    } while (secondIterator.moveNext());
  }

  return result;
}
