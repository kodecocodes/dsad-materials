// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/priority_queue.dart';

void main() {
  challengeOne();
  challengeTwo();
}

/// Challenge 1: Prioritize a Waitlist
///
/// Your favorite concert was sold out. Fortunately, there's a waitlist for
/// people who still want to go! However, ticket sales will first prioritize
/// someone with a military background, followed by seniority.
///
/// Use a priority queue to prioritize the order of people on the waitlist.
/// Start by making a `Person` class that you can instantiate like so:
///
/// ```
/// final person = Person(name: 'Josh', age: 21, isMilitary: true);
/// ```
void challengeOne() {
  final p1 = Person(name: 'Josh', age: 21, isMilitary: true);
  final p2 = Person(name: 'Jake', age: 22, isMilitary: true);
  final p3 = Person(name: 'Clay', age: 28, isMilitary: false);
  final p4 = Person(name: 'Cindy', age: 28, isMilitary: false);
  final p5 = Person(name: 'Sabrina', age: 30, isMilitary: false);

  final waitlist = [p1, p2, p3, p4, p5];

  var priorityQueue = PriorityQueue(elements: waitlist);
  while (!priorityQueue.isEmpty) {
    print(priorityQueue.dequeue());
  }
}

class Person extends Comparable<Person> {
  Person({
    required this.name,
    required this.age,
    required this.isMilitary,
  });

  final String name;
  final int age;
  final bool isMilitary;

  @override
  int compareTo(other) {
    if (isMilitary == other.isMilitary) {
      return age.compareTo(other.age);
    }
    return isMilitary ? 1 : -1;
  }

  @override
  String toString() {
    final military = (isMilitary) ? ', (military)' : '';
    return '$name, age $age$military';
  }
}

/// Challenge 2: List-Based Priority Queue
///
/// You've learned how to construct a priority queue by implementing the
/// `Queue` interface with an internal heap data structure. Now your challenge
/// is to do it again, but this time with a `List`.
void challengeTwo() {
  final priorityQueue = PriorityQueueList<num>(
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

class PriorityQueueList<E extends Comparable<E>> implements Queue<E> {
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
