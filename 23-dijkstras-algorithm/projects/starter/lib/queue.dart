// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}
