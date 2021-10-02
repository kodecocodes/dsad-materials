class Stack<E> {
  Stack() : _storage = <E>[];

  Stack.of(Iterable<E> elements) : _storage = List<E>.of(elements);

  final List<E> _storage;

  void push(E element) => _storage.add(element);

  E pop() => _storage.removeLast();

  E peek() => _storage.last;

  bool isEmpty() => _storage.isEmpty;

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }
}
