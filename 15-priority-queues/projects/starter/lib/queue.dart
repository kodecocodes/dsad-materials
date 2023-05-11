// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

abstract interface class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}
