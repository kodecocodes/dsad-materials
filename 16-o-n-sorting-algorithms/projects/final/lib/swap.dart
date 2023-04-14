// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

extension SwappableList<E> on List<E> {
  void swap(int indexA, int indexB) {
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }
}
