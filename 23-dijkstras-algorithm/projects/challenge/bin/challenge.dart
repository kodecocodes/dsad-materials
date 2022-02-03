// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:challenge/dijkstra.dart';
import 'package:challenge/graph.dart';

void main() {
  challengeOne();
  challengeTwo();
}

/// Challenge 1:
///
/// Given the following graph, step through Dijkstra’s algorithm yourself
/// to produce the shortest path to every other vertex starting from vertex A.
///
/// See the book for the image.
void challengeOne() {
  final graph = createGraph();
  final source = graph.vertices.first;
  final dijkstra = Dijkstra(graph);
  final paths = dijkstra.shortestPaths(source);
  print(paths);
}

Graph<String> createGraph() {
  final graph = AdjacencyList<String>();

  final a = graph.createVertex('A');
  final b = graph.createVertex('B');
  final c = graph.createVertex('C');
  final d = graph.createVertex('D');
  final e = graph.createVertex('E');

  graph.addEdge(a, b, weight: 1, edgeType: EdgeType.directed);
  graph.addEdge(a, c, weight: 12, edgeType: EdgeType.directed);
  graph.addEdge(a, e, weight: 21, edgeType: EdgeType.directed);
  graph.addEdge(b, c, weight: 8, edgeType: EdgeType.directed);
  graph.addEdge(b, d, weight: 9, edgeType: EdgeType.directed);
  graph.addEdge(c, e, weight: 2, edgeType: EdgeType.directed);
  graph.addEdge(d, e, weight: 2, edgeType: EdgeType.directed);

  return graph;
}

/// Challenge 2: Find all the shortest paths
///
/// Add an extension on `Dijkstra` that returns all the shortest paths in
/// list form from a given starting vertex. Here’s the method signature to
/// get you started:
///
/// ```
/// Map<Vertex<E>, List<Vertex<E>>> shortestPathsLists(Vertex<E> source)
/// ```
void challengeTwo() {
  final graph = createGraph();
  final source = graph.vertices.first;
  final dijkstra = Dijkstra(graph);
  final paths = dijkstra.shortestPathsLists(source);
  paths.forEach((vertex, path) {
    print('$vertex: $path');
  });
}

extension ShortestPaths<E> on Dijkstra<E> {
  Map<Vertex<E>, List<Vertex<E>>> shortestPathsLists(
    Vertex<E> source,
  ) {
    final allPathsLists = <Vertex<E>, List<Vertex<E>>>{};
    final allPaths = shortestPaths(source);
    for (final vertex in graph.vertices) {
      final path = shortestPath(
        source,
        vertex,
        paths: allPaths,
      );
      allPathsLists[vertex] = path;
    }
    return allPathsLists;
  }
}
