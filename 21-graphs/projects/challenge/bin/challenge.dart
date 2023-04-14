// Copyright (c) 2022 Razeware LLC
// For full license & permission details, see LICENSE.

import 'package:challenge/graph.dart';

void main() {
  challengeOne();
}

/// Challenge 1: Graph your friends
///
/// Megan has three friends: Sandra, Pablo and Edith. Pablo has friends
/// as well: Ray, Luke, and a mutual friend of Megan's. Edith is friends
/// with Manda and Vicki. Manda is friends with Pablo and Megan. Create
/// an adjacency list that represents this friendship graph. Which mutual
/// friend do Pablo and Megan share?
void challengeOne() {
  final graph = AdjacencyList<String>();

  final megan = graph.createVertex('Megan');
  final sandra = graph.createVertex('Sandra');
  final pablo = graph.createVertex('Pablo');
  final edith = graph.createVertex('Edith');
  final ray = graph.createVertex('Ray');
  final luke = graph.createVertex('Luke');
  final manda = graph.createVertex('Manda');
  final vicki = graph.createVertex('Vicki');

  graph.addEdge(megan, sandra, weight: 1);
  graph.addEdge(megan, pablo, weight: 1);
  graph.addEdge(megan, edith, weight: 1);
  graph.addEdge(pablo, ray, weight: 1);
  graph.addEdge(pablo, luke, weight: 1);
  graph.addEdge(edith, manda, weight: 1);
  graph.addEdge(edith, vicki, weight: 1);
  graph.addEdge(manda, pablo, weight: 1);
  graph.addEdge(manda, megan, weight: 1);

  print(graph);

  final megansFriends = Set.of(
    graph.edges(megan).map((edge) {
      return edge.destination.data;
    }),
  );
  final pablosFriends = Set.of(
    graph.edges(pablo).map((edge) {
      return edge.destination.data;
    }),
  );
  final mutualFriends = megansFriends.intersection(pablosFriends);
  print(mutualFriends);
}
