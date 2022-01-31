// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

class RingBuffer<E> {
  RingBuffer(int length) : _list = List.filled(length, null, growable: false);

  final List<E?> _list;
  int _writeIndex = 0;
  int _readIndex = 0;
  int _size = 0;

  bool get isFull => _size == _list.length;

  bool get isEmpty => _size == 0;

  void write(E element) {
    if (isFull) throw Exception('Buffer is full');
    _list[_writeIndex] = element;
    _writeIndex = _advance(_writeIndex);
    _size++;
  }

  int _advance(int index) {
    return (index == _list.length - 1) ? 0 : index + 1;
  }

  E? read() {
    if (isEmpty) return null;
    final element = _list[_readIndex];
    _readIndex = _advance(_readIndex);
    _size--;
    return element;
  }

  E? get peek => (isEmpty) ? null : _list[_readIndex];

  @override
  String toString() {
    final text = StringBuffer();
    text.write('[');
    int index = _readIndex;
    while (index != _writeIndex) {
      if (index != _readIndex) {
        text.write(', ');
      }
      text.write(_list[index % _list.length]);
      index++;
    }
    text.write(']');
    return text.toString();
  }
}
