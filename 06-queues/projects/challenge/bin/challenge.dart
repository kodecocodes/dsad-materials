// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'doubly_linked_list.dart';
import 'queue.dart';

void main() {
  challengeThree();
  challengeFour();
}

void challengeThree() {
  final monopolyTurn = QueueRingBuffer<String>(4);
  monopolyTurn.enqueue('Ray');
  monopolyTurn.enqueue('Vicki');
  monopolyTurn.enqueue('Luke');
  monopolyTurn.enqueue('Pablo');

  String? player;
  for (var i = 1; i <= 20; i++) {
    player = monopolyTurn.nextPlayer();
    print(player);
  }
  print('$player wins!');
}

extension BoardGameManager<E> on QueueRingBuffer<E> {
  E? nextPlayer() {
    final person = dequeue();
    if (person != null) {
      enqueue(person);
    }
    return person;
  }
}

void challengeFour() {
  final deque = DequeDoublyLinkedList<int>();
  deque.enqueue(1, Direction.back);
  deque.enqueue(2, Direction.back);
  deque.enqueue(3, Direction.back);
  deque.enqueue(4, Direction.back);

  print(deque);

  deque.enqueue(5, Direction.front);

  print(deque);

  deque.dequeue(Direction.back);
  deque.dequeue(Direction.back);
  deque.dequeue(Direction.back);
  deque.dequeue(Direction.front);
  deque.dequeue(Direction.front);
  deque.dequeue(Direction.front);

  print(deque);
}

enum Direction {
  front,
  back,
}

abstract class Deque<E> {
  bool get isEmpty;
  E? peek(Direction from);
  bool enqueue(E element, Direction to);
  E? dequeue(Direction from);
}

class DequeDoublyLinkedList<E> implements Deque<E> {
  final _list = DoublyLinkedList<E>();

  @override
  E? dequeue(Direction from) {
    switch (from) {
      case Direction.front:
        return _list.pop();
      case Direction.back:
        return _list.removeLast();
    }
  }

  @override
  bool enqueue(E value, Direction to) {
    switch (to) {
      case Direction.front:
        _list.push(value);
        break;
      case Direction.back:
        _list.append(value);
        break;
    }
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? peek(Direction from) {
    switch (from) {
      case Direction.front:
        return _list.head?.value;
      case Direction.back:
        return _list.tail?.value;
    }
  }

  @override
  String toString() => _list.toString();
}
