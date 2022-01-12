// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'trie_node.dart';

class Trie<E, T extends Iterable<E>> {
  TrieNode<E> root = TrieNode(key: null, parent: null);

  void insert(T collection) {
    var current = root;
    for (E element in collection) {
      current.children[element] ??= TrieNode(
        key: element,
        parent: current,
      );
      current = current.children[element]!;
    }
    current.isTerminating = true;
  }

  bool contains(T collection) {
    var current = root;
    for (E element in collection) {
      final child = current.children[element];
      if (child == null) {
        return false;
      }
      current = child;
    }
    return current.isTerminating;
  }

  void remove(T collection) {
    var current = root;
    for (E element in collection) {
      final child = current.children[element];
      if (child == null) {
        return;
      }
      current = child;
    }
    if (!current.isTerminating) {
      return;
    }
    current.isTerminating = false;
    while (current.parent != null &&
        current.children.isEmpty &&
        !current.isTerminating) {
      current.parent!.children[current.key!] = null;
      current = current.parent!;
    }
  }

  List<List<E>> matchPrefix(T prefix) {
    var current = root;
    for (E element in prefix) {
      final child = current.children[element];
      if (child == null) {
        return [];
      }
      current = child;
    }
    return _moreMatches(prefix.toList(), current);
  }

  List<List<E>> _moreMatches(List<E> prefix, TrieNode<E> node) {
    List<List<E>> results = [];
    if (node.isTerminating) {
      results.add(prefix);
    }
    for (final child in node.children.values) {
      final newPrefix = prefix.toList();
      newPrefix.add(child!.key!);
      results.addAll(
        _moreMatches(
          newPrefix,
          child,
        ),
      );
    }
    return results;
  }
}
