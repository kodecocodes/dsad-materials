// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

void main() {
  challengeOne();
  challengeTwo();
}

/// Challenge 1: List-based priority queue
///
/// You've learned how to construct a priority queue by implementing the
/// `Queue` interface with an internal heap data structure. Now your challenge
/// is to do it again, but this time with a `List`.
void challengeOne() {
  final priorityQueue = PriorityQueueList(
    elements: [1, 12, 3, 4, 1, 6, 8, 7],
  );
  print(priorityQueue);
  priorityQueue.enqueue(5);
  priorityQueue.enqueue(0);
  priorityQueue.enqueue(10);
  print(priorityQueue);
  while (!priorityQueue.isEmpty) {
    print(priorityQueue.dequeue());
  }
}

abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}

enum Priority { max, min }

class PriorityQueueList<E extends Comparable<dynamic>> implements Queue<E> {
  PriorityQueueList({List<E>? elements, Priority priority = Priority.max}) {
    _priority = priority;
    _elements = elements ?? [];
    _elements.sort((a, b) => _compareByPriority(a, b));
  }

  int _compareByPriority(E a, E b) {
    if (_priority == Priority.max) {
      return a.compareTo(b);
    }
    return b.compareTo(a);
  }

  late List<E> _elements;
  late Priority _priority;

  @override
  bool get isEmpty => _elements.isEmpty;

  @override
  E? get peek => (isEmpty) ? null : _elements.last;

  @override
  bool enqueue(E element) {
    for (int i = 0; i < _elements.length; i++) {
      if (_compareByPriority(element, _elements[i]) < 0) {
        _elements.insert(i, element);
        return true;
      }
    }
    _elements.add(element);
    return true;
  }

  @override
  E? dequeue() => isEmpty ? null : _elements.removeLast();

  @override
  String toString() => _elements.toString();
}

/// Challenge 2: Prioritize a waitlist
///
/// Your favorite concert was sold out. Fortunately, there's a waitlist for
/// people who still want to go! However, ticket sales will first prioritize
/// someone with a military background, followed by seniority.
///
/// Use a priority queue to tell you the order of people in the waitlist.
/// Here's a partially complete `Person` class to get you started:
///
/// ```
/// class Person extends Comparable<Person> {
///   Person(this.name, this.age, this.isMilitary);
///
///   final String name;
///   final int age;
///   final bool isMilitary;
///
///   @override
///   int compareTo(other) => throw UnimplementedError();
/// }
/// ```
void challengeTwo() {}
