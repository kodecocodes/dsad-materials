// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/queue.dart';
import 'package:challenge/tree.dart';

void main() {
  challengeOne();
  challengeTwo();
}

/// Challenge 1: Print a Tree in Level Order
///
/// Print all the values in a tree in an order based on their level. Nodes
/// in the same level should be printed on the same line. For example,
/// consider the following tree:
///
///         15
///   ┌─────┼────┐
///   1     17   20
/// ┌─┼─┐   │   ┌┴┐
/// 1 5 0   2   5 7
///
/// Your algorithm should print the following:
///
/// ```
/// 15
/// 1 17 20
/// 1 5 0 2 5 7
/// ```
void challengeOne() {
  final tree = buildTree();
  printEachLevel(tree);
}

TreeNode<int> buildTree() {
  return TreeNode(15)
    ..children.addAll([
      TreeNode(1)
        ..children.addAll([
          TreeNode(1),
          TreeNode(5),
          TreeNode(0),
        ]),
      TreeNode(17)
        ..children.addAll([
          TreeNode(2),
        ]),
      TreeNode(20)
        ..children.addAll([
          TreeNode(5),
          TreeNode(7),
        ]),
    ]);
}

void printEachLevel<T>(TreeNode<T> tree) {
  final result = StringBuffer();
  var queue = QueueStack<TreeNode<T>>();
  var nodesLeftInCurrentLevel = 0;
  queue.enqueue(tree);
  while (!queue.isEmpty) {
    nodesLeftInCurrentLevel = queue.length;
    while (nodesLeftInCurrentLevel > 0) {
      final node = queue.dequeue();
      if (node == null) break;
      result.write('${node.value} ');
      for (var element in node.children) {
        queue.enqueue(element);
      }
      nodesLeftInCurrentLevel -= 1;
    }
    result.write('\n');
  }
  print(result);
}

/// Challenge 2: Widget Tree
///
/// Flutter calls the nodes in its user-facing UI tree **widgets**. You can
/// make a mini-version of the same thing.
///
/// Create three separate nodes with the following names and types:
///
/// - `Column`: a tree node that takes multiple children
/// - `Padding`: a tree node that takes a single child
/// - `Text`: a tree leaf node
///
/// Use your widget nodes to build a simple widget tree.
void challengeTwo() {
  // ignore: unused_local_variable
  final tree = Column(
    children: [
      Padding(
        value: 8.0,
        child: Text('This'),
      ),
      Padding(
        value: 8.0,
        child: Text('is'),
      ),
      Column(
        children: [
          Text('my'),
          Text('widget'),
          Text('tree!'),
        ],
      ),
    ],
  );
}

class Widget {}

class Column extends Widget {
  Column({this.children});
  List<Widget>? children;
}

class Padding extends Widget {
  Padding({this.value = 0.0, this.child});
  double value;
  Widget? child;
}

class Text extends Widget {
  Text([this.value = '']);
  String value;
}
