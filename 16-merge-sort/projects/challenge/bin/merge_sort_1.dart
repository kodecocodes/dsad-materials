List<E> mergeSort<E extends Comparable<dynamic>>(List<E> list) {
  if (list.length < 2) {
    print('recursion ending:  $list');
    return list;
  } else {
    print('recursion list in: $list');
  }

  final middle = list.length ~/ 2;
  final left = mergeSort(list.sublist(0, middle));
  final right = mergeSort(list.sublist(middle));

  final merged = _merge(left, right);
  print('recursion ending:  merging $left and $right -> $merged');
  return merged;
}

List<E> _merge<E extends Comparable<dynamic>>(
  List<E> listA,
  List<E> listB,
) {
  var indexA = 0;
  var indexB = 0;
  final result = <E>[];
  while (indexA < listA.length && indexB < listB.length) {
    final valueA = listA[indexA];
    final valueB = listB[indexB];
    if (valueA.compareTo(valueB) < 0) {
      result.add(valueA);
      indexA += 1;
    } else if (valueA.compareTo(valueB) > 0) {
      result.add(valueB);
      indexB += 1;
    } else {
      result.add(valueA);
      result.add(valueB);
      indexA += 1;
      indexB += 1;
    }
  }
  if (indexA < listA.length) {
    result.addAll(listA.getRange(indexA, listA.length));
  }
  if (indexB < listB.length) {
    result.addAll(listB.getRange(indexB, listB.length));
  }
  return result;
}
