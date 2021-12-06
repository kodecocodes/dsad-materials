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

    test('single vertex', () {
      final graph = AdjacencyList<String>();
      graph.createVertex('a');
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
      expect(aEdges.first.weight, null);
      final bEdges = graph.edges(b);
      expect(bEdges.first.source, b);
      expect(bEdges.first.destination, a);
      expect(bEdges.first.weight, null);
      expect(graph.toString(), 'a --> b\nb --> a\n');
    });

    test('two vertices, directed', () {
      final graph = AdjacencyList<String>();
      final a = graph.createVertex('a');
      final b = graph.createVertex('b');
      graph.addEdge(a, b, edgeType: EdgeType.directed);
      final aEdges = graph.edges(a);
      expect(aEdges.first.source, a);
      expect(aEdges.first.destination, b);
      expect(aEdges.first.weight, null);
      final bEdges = graph.edges(b);
      expect(bEdges.isEmpty, true);
    });

    test('weight', () {
      final graph = AdjacencyList<String>();
      final a = graph.createVertex('a');
      final b = graph.createVertex('b');
      expect(graph.weight(a, b), null);
      graph.addEdge(a, b, weight: 3);
      expect(graph.weight(a, b), 3);
    });
  });

  group('AdjacencyMatrix:', () {
    test('empty graph', () {
      final graph = AdjacencyMatrix<String>();
      expect(graph.toString(), '');
    });

    test('single vertex', () {
      final graph = AdjacencyMatrix<String>();
      graph.createVertex('a');
      expect(graph.toString(), '0: a\n.     \n');
    });

    test('two vertices, undirected', () {
      final graph = AdjacencyMatrix<String>();
      final a = graph.createVertex('a');
      final b = graph.createVertex('b');
      graph.addEdge(a, b, weight: 1);
      final aEdges = graph.edges(a);
      expect(aEdges.first.source, a);
      expect(aEdges.first.destination, b);
      expect(aEdges.first.weight, 1);
      final bEdges = graph.edges(b);
      expect(bEdges.first.source, b);
      expect(bEdges.first.destination, a);
      expect(bEdges.first.weight, 1);
    });

    test('two vertices, directed', () {
      final graph = AdjacencyMatrix<String>();
      final a = graph.createVertex('a');
      final b = graph.createVertex('b');
      graph.addEdge(a, b, edgeType: EdgeType.directed, weight: 1);
      final aEdges = graph.edges(a);
      expect(aEdges.first.source, a);
      expect(aEdges.first.destination, b);
      expect(aEdges.first.weight, 1);
      final bEdges = graph.edges(b);
      expect(bEdges.isEmpty, true);
    });

    test('weight', () {
      final graph = AdjacencyMatrix<String>();
      final a = graph.createVertex('a');
      final b = graph.createVertex('b');
      expect(graph.weight(a, b), null);
      graph.addEdge(a, b, weight: 3);
      expect(graph.weight(a, b), 3);
    });
  });
}
