// Copyright (c) 2023 Kodeco Inc.
// For full license & permission details, see LICENSE.

import 'package:final_project/tree.dart';
import 'package:test/test.dart';

void main() {
  group('TreeNode:', () {
    test('Has value and children properties', () {
      final node = TreeNode<int>(1);
      expect(node.value, 1);
      expect(node.children.length, 0);
    });

    test('Can add children', () {
      final node = TreeNode<int>(1);
      node.add(TreeNode(2));
      expect(node.children.length, 1);
    });

    test('forEachDepthFirst', () {
      final tree = makeBeverageTree();
      final result = StringBuffer();
      tree.forEachDepthFirst((node) => result.write(node.value));
      expect(result.toString(),
          'beverageshotteablackgreenchaicoffeecocoacoldsodaginger alebitter lemonmilk');
    });

    test('forEachLevelOrder', () {
      final tree = makeBeverageTree();

      final result = StringBuffer();
      tree.forEachLevelOrder((node) => result.write(node.value));
      expect(result.toString(),
          'beverageshotcoldteacoffeecocoasodamilkblackgreenchaiginger alebitter lemon');
    });

    test('search', () {
      final tree = makeBeverageTree();

      final searchResult1 = tree.search('ginger ale');
      expect(searchResult1?.value, 'ginger ale');

      final searchResult2 = tree.search('water');
      expect(searchResult2?.value, isNull);
    });
  });
}

TreeNode<String> makeBeverageTree() {
  final tree = TreeNode('beverages');
  final hot = TreeNode('hot');
  final cold = TreeNode('cold');
  final tea = TreeNode('tea');
  final coffee = TreeNode('coffee');
  final chocolate = TreeNode('cocoa');
  final blackTea = TreeNode('black');
  final greenTea = TreeNode('green');
  final chaiTea = TreeNode('chai');
  final soda = TreeNode('soda');
  final milk = TreeNode('milk');
  final gingerAle = TreeNode('ginger ale');
  final bitterLemon = TreeNode('bitter lemon');

  tree.add(hot);
  tree.add(cold);

  hot.add(tea);
  hot.add(coffee);
  hot.add(chocolate);

  cold.add(soda);
  cold.add(milk);

  tea.add(blackTea);
  tea.add(greenTea);
  tea.add(chaiTea);

  soda.add(gingerAle);
  soda.add(bitterLemon);

  return tree;
}
