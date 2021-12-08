// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'queue.dart';
import 'graph.dart';

extension BreadthFirstSearch<E> on Graph<E> {
  List<Vertex<E>> breadthFirstSearch(Vertex<E> source) {
    final queue = QueueStack<Vertex<E>>();
    Set<Vertex<E>> enqueued = {};
    List<Vertex<E>> visited = [];

    queue.enqueue(source);
    enqueued.add(source);

    while (true) {
      final vertex = queue.dequeue();
      if (vertex == null) break;
      visited.add(vertex);
      final neighborEdges = edges(vertex);
      for (final edge in neighborEdges) {
        if (!enqueued.contains(edge.destination)) {
          queue.enqueue(edge.destination);
          enqueued.add(edge.destination);
        }
      }
    }

    return visited;
  }
}
