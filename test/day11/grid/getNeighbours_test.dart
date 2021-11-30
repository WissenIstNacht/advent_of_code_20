import 'package:test/test.dart';
import 'dart:io';

import '../../../bin/day11/grid.dart';

void main() {
  late Grid basicGrid, directionsGrid;
  setUp(() {
    var lines = File('test/day11/inputs/basicInput').readAsLinesSync();
    basicGrid = Grid.fromList(lines);
    lines = File('test/day11/inputs/allDirections').readAsLinesSync();
    directionsGrid = Grid.fromList(lines);
  });
  test('Checking values returned for getNeighbours on top left corner', () {
    print(basicGrid.toInts());
    final neighbours =
        basicGrid.getNeighbours(0, 0).map((n) => n.toInt()).toList();
    expect(neighbours, equals([2, 1, 0]));
  });
  test('Checking values returned for getNeighbours top right corner', () {
    final neighbours =
        basicGrid.getNeighbours(0, 2).map((n) => n.toInt()).toList();
    expect(neighbours, equals([2, 0, 2]));
  });
  test('Checking values returned for getNeighbours bottom left corner', () {
    final neighbours =
        basicGrid.getNeighbours(2, 0).map((n) => n.toInt()).toList();
    expect(neighbours, equals([1, 0, 1]));
  });
  test('Checking values returned for getNeighbours bottom right corner', () {
    final neighbours =
        basicGrid.getNeighbours(2, 2).map((n) => n.toInt()).toList();
    expect(neighbours, equals([0, 2, 1]));
  });
  test('Checking values returned for getNeighbours middle element', () {
    final neighbours =
        basicGrid.getNeighbours(1, 1).map((n) => n.toInt()).toList();
    expect(neighbours, equals([0, 2, 1, 1, 2, 2, 1, 0]));
  });
  test('Checking values returned for getNeighboursInSight for middle element',
      () {
    final neighbours = directionsGrid
        .getFirstNeighboursInSight(4, 3)
        .map((n) => n.toInt())
        .toList();
    expect(neighbours, equals([1, 1, 1, 1, 1, 1, 1, 1]));
  });
}
