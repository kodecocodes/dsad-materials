// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'avl_node.dart';
import 'dart:math' as math;

class AvlTree<E extends Comparable<E>> {
  AvlNode<E>? root;

  void insert(E value) {
    root = _insertAt(root, value);
  }

  AvlNode<E> _insertAt(AvlNode<E>? node, E value) {
    if (node == null) {
      return AvlNode(value);
    }
    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insertAt(node.leftChild, value);
    } else {
      node.rightChild = _insertAt(node.rightChild, value);
    }
    final balancedNode = balanced(node);
    balancedNode.height = 1 +
        math.max(
          balancedNode.leftHeight,
          balancedNode.rightHeight,
        );
    return balancedNode;
  }

  AvlNode<E> leftRotate(AvlNode<E> node) {
    // 1
    final pivot = node.rightChild!;
    // 2
    node.rightChild = pivot.leftChild;
    // 3
    pivot.leftChild = node;
    // 4
    node.height = 1 +
        math.max(
          node.leftHeight,
          node.rightHeight,
        );
    pivot.height = 1 +
        math.max(
          pivot.leftHeight,
          pivot.rightHeight,
        );
    // 5
    return pivot;
  }

  AvlNode<E> rightRotate(AvlNode<E> node) {
    final pivot = node.leftChild!;
    node.leftChild = pivot.rightChild;
    pivot.rightChild = node;
    node.height = 1 +
        math.max(
          node.leftHeight,
          node.rightHeight,
        );
    pivot.height = 1 +
        math.max(
          pivot.leftHeight,
          pivot.rightHeight,
        );
    return pivot;
  }

  AvlNode<E> rightLeftRotate(AvlNode<E> node) {
    if (node.rightChild == null) {
      return node;
    }
    node.rightChild = rightRotate(node.rightChild!);
    return leftRotate(node);
  }

  AvlNode<E> leftRightRotate(AvlNode<E> node) {
    if (node.leftChild == null) {
      return node;
    }
    node.leftChild = leftRotate(node.leftChild!);
    return rightRotate(node);
  }

  AvlNode<E> balanced(AvlNode<E> node) {
    switch (node.balanceFactor) {
      case 2:
        final left = node.leftChild;
        if (left != null && left.balanceFactor == -1) {
          return leftRightRotate(node);
        } else {
          return rightRotate(node);
        }
      case -2:
        final right = node.rightChild;
        if (right != null && right.balanceFactor == 1) {
          return rightLeftRotate(node);
        } else {
          return leftRotate(node);
        }
      default:
        return node;
    }
  }

  void remove(E value) {
    root = _remove(root, value);
  }

  AvlNode<E>? _remove(AvlNode<E>? node, E value) {
    if (node == null) return null;
    if (value == node.value) {
      if (node.leftChild == null && node.rightChild == null) {
        return null;
      }
      if (node.leftChild == null) {
        return node.rightChild;
      }
      if (node.rightChild == null) {
        return node.leftChild;
      }
      node.value = node.rightChild!.min.value;
      node.rightChild = _remove(node.rightChild, node.value);
    } else if (value.compareTo(node.value) < 0) {
      node.leftChild = _remove(node.leftChild, value);
    } else {
      node.rightChild = _remove(node.rightChild, value);
    }
    final balancedNode = balanced(node);
    balancedNode.height = 1 +
        math.max(
          balancedNode.leftHeight,
          balancedNode.rightHeight,
        );
    return balancedNode;
  }

  bool contains(E value) {
    var current = root;
    while (current != null) {
      if (current.value == value) {
        return true;
      }
      if (value.compareTo(current.value) < 0) {
        current = current.leftChild;
      } else {
        current = current.rightChild;
      }
    }
    return false;
  }

  @override
  String toString() => root.toString();
}

extension _MinFinder<E> on AvlNode<E> {
  AvlNode<E> get min => leftChild?.min ?? this;
}
