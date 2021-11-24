// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

class BinaryNode<T> {
  BinaryNode(this.value);
  T value;
  BinaryNode<T>? leftChild;
  BinaryNode<T>? rightChild;

  void traverseInOrder(void Function(T value) action) {
    leftChild?.traverseInOrder(action);
    action(value);
    rightChild?.traverseInOrder(action);
  }

  void traversePreOrder(void Function(T value) action) {
    action(value);
    leftChild?.traversePreOrder(action);
    rightChild?.traversePreOrder(action);
  }

  void traversePostOrder(void Function(T value) action) {
    leftChild?.traversePostOrder(action);
    rightChild?.traversePostOrder(action);
    action(value);
  }

  @override
  String toString() {
    final out = StringBuffer();

    rightChild?._buildTree(out, true, '');
    out.writeln(value);
    leftChild?._buildTree(out, false, '');

    return out.toString();
  }

  void _buildTree(StringBuffer out, bool isRight, String indent) {
    rightChild?._buildTree(out, true, indent + (isRight ? '     ' : '│    '));

    out
      ..write(indent)
      ..write(isRight ? '┌─── ' : '└─── ')
      ..writeln(value);

    leftChild?._buildTree(out, false, indent + (isRight ? '│    ' : '     '));
  }
}
