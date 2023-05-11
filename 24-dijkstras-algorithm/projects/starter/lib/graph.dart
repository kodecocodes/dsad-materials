// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

class Vertex<T> {
  const Vertex({
    required this.index,
    required this.data,
  });

  final int index;
  final T data;

  @override
  String toString() => data.toString();
}

class Edge<T> {
  const Edge(
    this.source,
    this.destination, [
    this.weight,
  ]);

  final Vertex<T> source;
  final Vertex<T> destination;
  final double? weight;
}

enum EdgeType { directed, undirected }

abstract interface class Graph<E> {
  Iterable<Vertex<E>> get vertices;

  Vertex<E> createVertex(E data);

  void addEdge(
    Vertex<E> source,
    Vertex<E> destination, {
    EdgeType edgeType,
    double? weight,
  });

  List<Edge<E>> edges(Vertex<E> source);

  double? weight(
    Vertex<E> source,
    Vertex<E> destination,
  );
}

class AdjacencyList<E> implements Graph<E> {
  final Map<Vertex<E>, List<Edge<E>>> _connections = {};
  var _nextIndex = 0;

  @override
  Iterable<Vertex<E>> get vertices => _connections.keys;

  @override
  Vertex<E> createVertex(E data) {
    final vertex = Vertex(
      index: _nextIndex,
      data: data,
    );
    _nextIndex++;
    _connections[vertex] = [];
    return vertex;
  }

  @override
  void addEdge(
    Vertex<E> source,
    Vertex<E> destination, {
    EdgeType edgeType = EdgeType.undirected,
    double? weight,
  }) {
    _connections[source]?.add(
      Edge(source, destination, weight),
    );
    if (edgeType == EdgeType.undirected) {
      _connections[destination]?.add(
        Edge(destination, source, weight),
      );
    }
  }

  @override
  List<Edge<E>> edges(Vertex<E> source) {
    return _connections[source] ?? [];
  }

  @override
  double? weight(
    Vertex<E> source,
    Vertex<E> destination,
  ) {
    final match = edges(source).where((edge) {
      return edge.destination == destination;
    });
    if (match.isEmpty) return null;
    return match.first.weight;
  }

  @override
  String toString() {
    final result = StringBuffer();
    _connections.forEach((vertex, edges) {
      final destinations = edges.map((edge) {
        return edge.destination;
      }).join(', ');
      result.writeln('$vertex --> $destinations');
    });
    return result.toString();
  }
}

class AdjacencyMatrix<E> implements Graph<E> {
  final List<Vertex<E>> _vertices = [];
  final List<List<double?>?> _weights = [];
  var _nextIndex = 0;

  @override
  Iterable<Vertex<E>> get vertices => _vertices;

  @override
  Vertex<E> createVertex(E data) {
    final vertex = Vertex(
      index: _nextIndex,
      data: data,
    );
    _nextIndex++;
    _vertices.add(vertex);
    for (var i = 0; i < _weights.length; i++) {
      _weights[i]?.add(null);
    }
    final row = List<double?>.filled(
      _vertices.length,
      null,
      growable: true,
    );
    _weights.add(row);
    return vertex;
  }

  @override
  void addEdge(
    Vertex<E> source,
    Vertex<E> destination, {
    EdgeType edgeType = EdgeType.undirected,
    double? weight,
  }) {
    _weights[source.index]?[destination.index] = weight;
    if (edgeType == EdgeType.undirected) {
      _weights[destination.index]?[source.index] = weight;
    }
  }

  @override
  List<Edge<E>> edges(Vertex<E> source) {
    List<Edge<E>> edges = [];
    for (var column = 0; column < _weights.length; column++) {
      final weight = _weights[source.index]?[column];
      if (weight == null) continue;
      final destination = _vertices[column];
      edges.add(Edge(source, destination, weight));
    }
    return edges;
  }

  @override
  double? weight(Vertex<E> source, Vertex<E> destination) {
    return _weights[source.index]?[destination.index];
  }

  @override
  String toString() {
    final output = StringBuffer();
    for (final vertex in _vertices) {
      output.writeln('${vertex.index}: ${vertex.data}');
    }
    for (int i = 0; i < _weights.length; i++) {
      for (int j = 0; j < _weights.length; j++) {
        final value = (_weights[i]?[j] ?? '.').toString();
        output.write(value.padRight(6));
      }
      output.writeln();
    }
    return output.toString();
  }
}
