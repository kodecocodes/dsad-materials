// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:final_project/graph.dart';
import 'package:test/test.dart';

void main() {
  group('AdjacencyList:', () {
    test('empty graph', () {
      final graph = AdjacencyList<String>();
      expect(graph.toString(), '');
    });

    test('since vertex', () {
      final graph = AdjacencyList<String>();
      final vertex = graph.createVertex('a');
      expect(graph.toString(), 'a --> \n');
    });

    test('two vertices, undirected', () {
      final graph = AdjacencyList<String>();
      final a = graph.createVertex('a');
      final b = graph.createVertex('b');
      graph.addEdge(a, b);
      final aEdges = graph.edges(a);
      expect(aEdges.first.source, a);
      expect(aEdges.first.destination, b);
      final bEdges = graph.edges(b);
      expect(bEdges.first.source, b);
      expect(bEdges.first.destination, a);

      // expect(graph.toString(), 'a --> b');
    });
  });
}

// TODO test `weight` with empty 