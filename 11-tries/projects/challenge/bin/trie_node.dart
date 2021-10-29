// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

class TrieNode<T> {
  TrieNode({this.key, this.parent});

  T? key;

  TrieNode<T>? parent;

  Map<T, TrieNode<T>?> children = {};

  bool isTerminating = false;
}
