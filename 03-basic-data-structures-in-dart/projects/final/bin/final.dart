// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.

import 'dart:collection';

void main() {
  lists();
  maps();
  sets();
}

void lists() {
  final people = ['Pablo', 'Manda', 'Megan'];
  print(people[0]);
  print(people[1]);
  print(people[2]);

  people.add('Edith');
  print(people);
  people.insert(0, 'Ray');
  print(people);
}

void maps() {
  final scores = {'Eric': 9, 'Mark': 12, 'Wayne': 1};
  scores['Andrew'] = 0;
  print(scores);

  final hashMap = HashMap.of(scores);
  print(hashMap);
}

void sets() {
  var bag = {'Candy', 'Juice', 'Gummy'};
  bag.add('Candy');
  print(bag);

  final myList = [1, 2, 2, 3, 4];
  final mySet = <int>{};
  for (final item in myList) {
    if (mySet.contains(item)) {
      // mySet already has it, so it's a duplicate
    }
    mySet.add(item);
  }
}
