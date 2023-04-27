// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:challenge/breadth_first_search.dart';
import 'package:challenge/graph.dart';
import 'package:challenge/queue.dart';

void main() {
  challengeOne();
  challengeTwo();
  challengeThree();
}

/// Challenge 1: Maximum Queue Size
///
/// For the following undirected graph, list the **maximum** number of
/// items ever in the queue. Assume that the starting vertex is **A**.
///
/// - See the chapter for the image.
void challengeOne() {
  final graph = AdjacencyList<String>();

  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');
  final e = graph.createVertex('E');
  final f = graph.createVertex('F');
  final g = graph.createVertex('G');
  final h = graph.createVertex('H');
  final i = graph.createVertex('I');
  final j = graph.createVertex('J');

  graph.addEdge(a, b, weight: 1);
  graph.addEdge(a, c, weight: 1);
  graph.addEdge(a, d, weight: 1);
  graph.addEdge(c, i, weight: 1);
  graph.addEdge(d, i, weight: 1);
  graph.addEdge(e, f, weight: 1);
  graph.addEdge(e, h, weight: 1);
  graph.addEdge(f, g, weight: 1);
  graph.addEdge(f, i, weight: 1);
  graph.addEdge(g, i, weight: 1);
  graph.addEdge(i, j, weight: 1);

  graph.queuePrintingBfs(a);
  // The max number of items in the queue is 3.
}

// This BFS extension adds some print statements so that you can observe
// the number of items in the queue.
extension QueuePrintingBfs<E> on Graph<E> {
  List<Vertex<E>> queuePrintingBfs(Vertex<E> source) {
    final queue = QueueStack<Vertex<E>>();
    Set<Vertex<E>> enqueued = {};
    List<Vertex<E>> visited = [];

    queue.enqueue(source);
    enqueued.add(source);
    print('Queue: $queue');

    while (true) {
      final vertex = queue.dequeue();
      print('Queue: $queue');
      if (vertex == null) break;
      visited.add(vertex);
      final neighborEdges = edges(vertex);
      for (final edge in neighborEdges) {
        if (!enqueued.contains(edge.destination)) {
          queue.enqueue(edge.destination);
          enqueued.add(edge.destination);
          print('Queue: $queue');
        }
      }
    }
    return visited;
  }
}

/// Challenge 2: Iterative BFS
///
/// In this chapter, you created an iterative implementation of
/// breadth-first search. Now write a recursive solution.
void challengeTwo() {
  final graph = AdjacencyList<String>();

  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');
  final e = graph.createVertex('E');
  final f = graph.createVertex('F');
  final g = graph.createVertex('G');
  final h = graph.createVertex('H');

  graph.addEdge(a, b, weight: 1);
  graph.addEdge(a, c, weight: 1);
  graph.addEdge(a, d, weight: 1);
  graph.addEdge(b, e, weight: 1);
  graph.addEdge(c, f, weight: 1);
  graph.addEdge(c, g, weight: 1);
  graph.addEdge(e, h, weight: 1);
  graph.addEdge(e, f, weight: 1);
  graph.addEdge(f, g, weight: 1);

  final vertices = graph.bfs(a);
  vertices.forEach(print);
}

extension RecursiveBfs<E> on Graph<E> {
  List<Vertex<E>> bfs(Vertex<E> source) {
    final queue = QueueStack<Vertex<E>>();
    final Set<Vertex<E>> enqueued = {};
    List<Vertex<E>> visited = [];

    queue.enqueue(source);
    enqueued.add(source);

    _bfs(queue, enqueued, visited);
    return visited;
  }

  void _bfs(
    QueueStack<Vertex<E>> queue,
    Set<Vertex<E>> enqueued,
    List<Vertex<E>> visited,
  ) {
    final vertex = queue.dequeue();
    if (vertex == null) return;
    visited.add(vertex);
    final neighborEdges = edges(vertex);
    for (final edge in neighborEdges) {
      if (!enqueued.contains(edge.destination)) {
        queue.enqueue(edge.destination);
        enqueued.add(edge.destination);
      }
    }
    _bfs(queue, enqueued, visited);
  }
}

/// Challenge 3: Disconnected Graph
///
/// Add a method to `Graph` to detect if a graph is disconnected. An example
/// of a disconnected graph is shown below:
///
/// - See the chapter for the image.
void challengeThree() {
  final graph = AdjacencyList<String>();
  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');
  final e = graph.createVertex('E');
  final f = graph.createVertex('F');
  final g = graph.createVertex('G');
  final h = graph.createVertex('H');

  graph.addEdge(a, b, weight: 1);
  graph.addEdge(a, c, weight: 1);
  graph.addEdge(a, d, weight: 1);

  graph.addEdge(e, h, weight: 1);
  graph.addEdge(e, f, weight: 1);
  graph.addEdge(f, g, weight: 1);

  print(graph.isConnected());

  // Add the following connection to connect the graphs
  graph.addEdge(a, e, weight: 1);
  print(graph.isConnected());
}

// lib/graph.dart was modified to include an `allVertices` method.
extension Connected<E> on Graph<E> {
  bool isConnected() {
    if (vertices.isEmpty) return true;
    final visited = breadthFirstSearch(vertices.first);
    for (final vertex in vertices) {
      if (!visited.contains(vertex)) {
        return false;
      }
    }
    return true;
  }
}
