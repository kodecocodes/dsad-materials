// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

abstract class TraversableBinaryNode<T> {
  T get value;
  TraversableBinaryNode<T>? get leftChild;
  TraversableBinaryNode<T>? get rightChild;

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
}

class AvlNode<T> extends TraversableBinaryNode<T> {
  AvlNode(this.value);

  @override
  T value;

  @override
  AvlNode<T>? leftChild;

  @override
  AvlNode<T>? rightChild;

  int height = 0;
  int get balanceFactor => leftHeight - rightHeight;
  int get leftHeight => leftChild?.height ?? -1;
  int get rightHeight => rightChild?.height ?? -1;

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(
    AvlNode<T>? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(node.rightChild, '$top ', '$top┌──', '$top│ ');
    final b = '$root${node.value}\n';
    final c = _diagram(node.leftChild, '$bottom│ ', '$bottom└──', '$bottom ');
    return '$a$b$c';
  }
}
