class Node<T> {
  Node({required this.value, this.next, this.previous});
  T value;
  Node<T>? next;
  Node<T>? previous;

  @override
  String toString() {
    return '$value';
  }
}

abstract class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;
  bool get isEmpty;
  void append(E value);
  void push(E value);
  E? pop();
  E? removeLast();
}

class DoublyLinkedList<E> extends Iterable<E> implements LinkedList<E> {
  @override
  Node<E>? head;

  @override
  Node<E>? tail;

  @override
  bool get isEmpty => head == null;

  @override
  void append(E value) {
    final newNode = Node(value: value, previous: tail);
    if (isEmpty) {
      head = newNode;
    } else {
      tail!.next = newNode;
      head?.next ??= newNode;
    }
    tail = newNode;
  }

  @override
  void push(E value) {
    final newNode = Node(value: value, next: head);
    if (isEmpty) {
      tail = newNode;
    } else {
      head!.previous = newNode;
      tail?.previous ??= newNode;
    }
    head = newNode;
  }

  @override
  E? pop() {
    if (isEmpty) return null;
    final value = head?.value;
    if (head?.next == null) {
      head = null;
      tail = null;
      return value;
    }
    head = head?.next;
    head?.previous = null;
    return value;
  }

  @override
  E? removeLast() {
    if (tail?.previous == null) return pop();
    final value = tail?.value;
    tail = tail?.previous;
    tail?.next = null;
    return value;
  }

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);

  @override
  String toString() => '[${join(', ')}]';
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(DoublyLinkedList<E> list) : _list = list;
  final DoublyLinkedList<E> _list;
  Node<E>? _currentNode;
  bool _firstPass = true;

  @override
  E get current => _currentNode!.value;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }
    return _currentNode != null;
  }
}
