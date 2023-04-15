// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/dijkstra.dart';
import 'package:final_project/graph.dart';
import 'package:test/test.dart';

void main() {
  group('Dijkstra:', () {
    test('shortestPath(s)', () {
      final graph = AdjacencyList<String>();

      final a = graph.createVertex('A');
      final b = graph.createVertex('B');
      final c = graph.createVertex('C');
      final d = graph.createVertex('D');
      final e = graph.createVertex('E');
      final f = graph.createVertex('F');
      final g = graph.createVertex('G');
      final h = graph.createVertex('H');

      graph.addEdge(a, b, weight: 8, edgeType: EdgeType.directed);
      graph.addEdge(a, f, weight: 9, edgeType: EdgeType.directed);
      graph.addEdge(a, g, weight: 1, edgeType: EdgeType.directed);
      graph.addEdge(g, c, weight: 3, edgeType: EdgeType.directed);
      graph.addEdge(c, b, weight: 3, edgeType: EdgeType.directed);
      graph.addEdge(c, e, weight: 1, edgeType: EdgeType.directed);
      graph.addEdge(e, b, weight: 1, edgeType: EdgeType.directed);
      graph.addEdge(e, d, weight: 2, edgeType: EdgeType.directed);
      graph.addEdge(b, e, weight: 1, edgeType: EdgeType.directed);
      graph.addEdge(b, f, weight: 3, edgeType: EdgeType.directed);
      graph.addEdge(f, a, weight: 2, edgeType: EdgeType.directed);
      graph.addEdge(h, g, weight: 5, edgeType: EdgeType.directed);
      graph.addEdge(h, f, weight: 2, edgeType: EdgeType.directed);

      final dijkstra = Dijkstra(graph);
      final source = graph.vertices.first;
      final allPaths = dijkstra.shortestPaths(source);

      expect(allPaths[a]?.distance, 0.0);
      expect(allPaths[a]?.vertex?.data, isNull);
      expect(allPaths[b]?.distance, 6.0);
      expect(allPaths[b]?.vertex?.data, 'E');
      expect(allPaths[c]?.distance, 4.0);
      expect(allPaths[c]?.vertex?.data, 'G');
      expect(allPaths[d]?.distance, 7.0);
      expect(allPaths[d]?.vertex?.data, 'E');
      expect(allPaths[e]?.distance, 5.0);
      expect(allPaths[e]?.vertex?.data, 'C');
      expect(allPaths[f]?.distance, 9.0);
      expect(allPaths[f]?.vertex?.data, 'A');
      expect(allPaths[g]?.distance, 1.0);
      expect(allPaths[g]?.vertex?.data, 'A');
      expect(allPaths[h]?.distance, isNull);
      expect(allPaths[h]?.vertex?.data, isNull);

      var path = dijkstra.shortestPath(a, a);
      expect(path, [a]);
      path = dijkstra.shortestPath(a, g);
      expect(path, [a, g]);
      path = dijkstra.shortestPath(a, c);
      expect(path, [a, g, c]);
      path = dijkstra.shortestPath(a, e);
      expect(path, [a, g, c, e]);
      path = dijkstra.shortestPath(a, d);
      expect(path, [a, g, c, e, d]);
      path = dijkstra.shortestPath(a, b);
      expect(path, [a, g, c, e, b]);
      path = dijkstra.shortestPath(a, f);
      expect(path, [a, f]);
      path = dijkstra.shortestPath(a, h);
      expect(path, <Vertex<String>>[]);
    });
  });
}
