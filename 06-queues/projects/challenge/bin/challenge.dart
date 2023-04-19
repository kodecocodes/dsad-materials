// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/deque.dart';
import 'package:challenge/queue.dart';

void main() {
  challengeOne();
  challengeTwo();
  challengeThree();
  challengeFour();
}

/// Challenge 1: Stack vs. Queue
///
/// Explain the difference between a stack and a queue. Provide two real-life
/// examples for each data structure.
void challengeOne() {
  // See written explanation in the Challenge Solutions chapter.
}

/// Challenge 2: Step-by-step Diagrams
///
/// Given the following queue where the left is the front of the queue and
/// the right is the back:
///
/// SPEED
///
/// Provide step-by-step diagrams showing how the following series of
/// commands affects the queue internally:
///
/// ```
/// queue.enqueue('D');
/// queue.enqueue('A');
/// queue.dequeue();
/// queue.enqueue('R');
/// queue.dequeue();
/// queue.dequeue();
/// queue.enqueue('T');
/// ```
///
/// Do this for each of the following queue implementations:
///
/// 1. List
/// 2. Linked list
/// 3. Ring buffer
/// 4. Double stack
///
/// Assume that the list and ring buffer have an initial size of 5.
void challengeTwo() {
  // See the Challenge Solutions chapter for the diagrams.
  enqueueDequeue(QueueList<String>());
  enqueueDequeue(QueueLinkedList<String>());
  enqueueDequeue(QueueRingBuffer<String>(5));
  enqueueDequeue(QueueStack<String>());
}

void enqueueDequeue(Queue<String> queue) {
  queue.enqueue('S');
  queue.enqueue('P');
  queue.enqueue('E');
  queue.enqueue('E');
  queue.enqueue('D');

  queue.enqueue('D');
  queue.enqueue('A');
  queue.dequeue();
  queue.enqueue('R');
  queue.dequeue();
  queue.dequeue();
  queue.enqueue('T');
}

/// Challenge 3: Whose turn is it?
///
/// Imagine that you are playing a game of Monopoly with your friends. The
/// problem is that everyone always forgets whose turn it is! Create a
/// Monopoly organizer that always tells you whose turn it is. Below is an
/// extension method that you can implement:
///
/// ```dart
/// extension BoardGameManager<E> on QueueRingBuffer {
///   E? nextPlayer() {
///     // TODO
///   }
/// }
/// ```
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

/// Challenge 4: Double-ended Queue
///
/// A doubled-ended queue — a.k.a. **deque** — is, as its name suggests, a
/// queue where elements can be added or removed from the front or back.
///
/// - A queue (FIFO order) allows you to add elements to the back and remove
///   from the front.
/// - A stack (LIFO order) allows you to add elements to the back, and remove
///   from the back.
///
/// Deque can be considered both a queue and a stack at the same time.
///
/// Your challenge is to build a deque. Below is a simple `Deque` interface to
/// help you build your data structure. The enum `Direction` describes whether
/// you are adding or removing an element from the front or back of the deque.
/// You can use any data structure you prefer to construct a `Deque`.
///
/// ```
/// enum Direction {
///   front,
///   back,
/// }
///
/// abstract class Deque<E> {
///   bool get isEmpty;
///   E? peek(Direction from);
///   bool enqueue(E element, Direction to);
///   E? dequeue(Direction from);
/// }
/// ```
void challengeFour() {
  final deque = DequeLinkedList<int>();
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
