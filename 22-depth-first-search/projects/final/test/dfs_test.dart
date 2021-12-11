// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/depth_first_search.dart';
import 'package:final_project/graph.dart';
import 'package:test/test.dart';

void main() {
  group('depthFirstSearch:', () {
    test('depth-first search', () {
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
      graph.addEdge(c, g, weight: 1);
      graph.addEdge(e, f, weight: 1);
      graph.addEdge(e, h, weight: 1);
      graph.addEdge(f, g, weight: 1);
      graph.addEdge(f, c, weight: 1);

      final vertices = graph.depthFirstSearch(a);
      expect(vertices[0].data, 'A');
      expect(vertices[1].data, 'B');
      expect(vertices[2].data, 'E');
      expect(vertices[3].data, 'F');
      expect(vertices[4].data, 'G');
      expect(vertices[5].data, 'C');
      expect(vertices[6].data, 'H');
      expect(vertices[7].data, 'D');
    });
  });

  group('cycles:', () {
    test('has cycle', () {
      final graph = AdjacencyList<String>();

      final a = graph.createVertex('A');
      final b = graph.createVertex('B');
      final c = graph.createVertex('C');
      final d = graph.createVertex('D');

      graph.addEdge(a, b, edgeType: EdgeType.directed);
      graph.addEdge(a, c, edgeType: EdgeType.directed);
      graph.addEdge(c, a, edgeType: EdgeType.directed);
      graph.addEdge(b, c, edgeType: EdgeType.directed);
      graph.addEdge(c, d, edgeType: EdgeType.directed);

      expect(graph.hasCycle(a), true);
    });

    test('does not have cycle', () {
      final graph = AdjacencyList<String>();

      final a = graph.createVertex('A');
      final b = graph.createVertex('B');
      final c = graph.createVertex('C');
      final d = graph.createVertex('D');

      graph.addEdge(a, b, edgeType: EdgeType.directed);
      graph.addEdge(a, c, edgeType: EdgeType.directed);
      graph.addEdge(b, c, edgeType: EdgeType.directed);
      graph.addEdge(c, d, edgeType: EdgeType.directed);

      expect(graph.hasCycle(a), false);
    });

    test('diamond dependency', () {
      final graph = AdjacencyList<String>();

      final a = graph.createVertex('A');
      final b = graph.createVertex('B');
      final c = graph.createVertex('C');
      final d = graph.createVertex('D');

      graph.addEdge(a, b, edgeType: EdgeType.directed);
      graph.addEdge(a, c, edgeType: EdgeType.directed);
      graph.addEdge(b, d, edgeType: EdgeType.directed);
      graph.addEdge(c, d, edgeType: EdgeType.directed);

      expect(graph.hasCycle(a), false);
    });
  });
}
