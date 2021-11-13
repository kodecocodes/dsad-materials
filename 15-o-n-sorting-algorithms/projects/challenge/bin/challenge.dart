// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

void main() {
  challengeOne();
  challengeTwo();
  challengeThree();
  challengeFour();
}

/// Challenge 1: Bubble up
///
/// Here is a list of randomly distributed elements:
///
/// [4, 2, 5, 1, 3]
///
/// Work out by hand the steps that a bubble sort would perform on
/// this list.
void challengeOne() {
  bubbleSort([4, 2, 5, 1, 3]);
}

void bubbleSort<E extends Comparable<dynamic>>(List<E> list) {
  print('\n--- BUBBLE SORT ---\n');
  print('$list // start\n');
  for (var end = list.length - 1; end > 0; end--) {
    var swapped = false;
    for (var current = 0; current < end; current++) {
      if (list[current].compareTo(list[current + 1]) > 0) {
        list.swap(current, current + 1);
        swapped = true;
        print('$list // ${list[current + 1]}-${list[current]} swapped');
      } else {
        print('$list // ${list[current]}-${list[current + 1]} not swapped');
      }
    }
    if (!swapped) return;
    print('');
  }
}

extension SwappableList<E> on List<E> {
  void swap(int indexA, int indexB) {
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }
}

/// Challenge 2: Select the right one
///
/// Given the same list as above:
///
/// [4, 2, 5, 1, 3]
///
/// Work out by hand the steps that a selection sort would perform on
/// this list.
void challengeTwo() {
  selectionSort([4, 2, 5, 1, 3]);
}

void selectionSort<E extends Comparable<dynamic>>(List<E> list) {
  print('\n--- SELECTION SORT ---\n');
  print('$list // start\n');
  for (var current = 0; current < list.length - 1; current++) {
    var lowest = current;
    for (var next = current + 1; next < list.length; next++) {
      final comparison = '${list[next]}-${list[lowest]}';
      if (list[next].compareTo(list[lowest]) < 0) {
        print('$list // compare $comparison, lowest: ${list[next]}');
        lowest = next;
      } else {
        print('$list // compare $comparison, lowest: ${list[lowest]}');
      }
    }
    print('');
    if (lowest != current) {
      list.swap(lowest, current);
      final comparison = '${list[lowest]}-${list[current]}';
      print('// swap $comparison, reset lowest: ${list[current + 1]}');
    } else if (current == list.length - 2) {
      print('// no swap needed');
    } else {
      print('// no swap needed, reset lowest: ${list[current + 1]}');
    }
    print('');
  }
}

/// Challenge 3: Insert here
///
/// Again, using the same initial list as in the previous challenges:
///
/// [4, 2, 5, 1, 3]
///
/// Work out by hand the steps that an insertion sort would would take to
/// sort this list.
void challengeThree() {
  insertionSort([4, 2, 5, 1, 3]);
}

void insertionSort<E extends Comparable<dynamic>>(List<E> list) {
  print('\n--- INSERTION SORT ---\n');
  print('$list // start\n');
  for (var current = 1; current < list.length; current++) {
    for (var shifting = current; shifting > 0; shifting--) {
      if (list[shifting].compareTo(list[shifting - 1]) < 0) {
        list.swap(shifting, shifting - 1);
        print('$list // ${list[shifting]}-${list[shifting - 1]} swapped');
      } else {
        print('$list // ${list[shifting - 1]}-${list[shifting]} not swapped');
        break;
      }
    }
    print('');
  }
}

/// Challenge 4: Already sorted
///
/// When you have a list that's already sorted like the following:
///
/// [1, 2, 3, 4, 5]
///
/// Are bubble sort, selection sort and insertion sort still _O_(_n²_)?
/// Show the step-by-step moves that each algorithm takes.
void challengeFour() {
  bubbleSort([1, 2, 3, 4, 5]);
  selectionSort([1, 2, 3, 4, 5]);
  insertionSort([1, 2, 3, 4, 5]);
}
