import 'package:test/test.dart';
import 'dart:io';

import '../../../bin/day11/grid.dart';

void main() {
  late Grid basicGrid, floorGrid, emptyGrid;
  setUp(() {
    var lines = File('test/day11/inputs/basicInput').readAsLinesSync();
    basicGrid = Grid.fromList(lines);
    lines = File('test/day11/inputs/dotsInput').readAsLinesSync();
    floorGrid = Grid.fromList(lines);
    lines = File('test/day11/inputs/lsInput').readAsLinesSync();
    emptyGrid = Grid.fromList(lines);
  });
  test('Check that basic inputs middle has occupied neighbours', () {
    var neighbourhood = basicGrid.getNeighbours(1, 1);
    expect(neighbourhood.hasOccupiedNeighbor(1, 1), equals(true));
  });
  test('Check that basic inputs top right has no occupied neighbours', () {
    var neighbourhood = basicGrid.getNeighbours(0, 2);
    expect(neighbourhood.hasOccupiedNeighbor(0, 2), equals(false));
  });
  test('Check that basic inputs bottom left has occupied neighbours', () {
    var neighbourhood = basicGrid.getNeighbours(0, 2);
    expect(neighbourhood.hasOccupiedNeighbor(0, 2), equals(false));
  });
  test('Check that dots input in middle has no occupied neighbours', () {
    var neighbourhood = floorGrid.getNeighbours(1, 1);
    expect(neighbourhood.hasOccupiedNeighbor(1, 1), equals(false));
  });
  test('Check that ls inputs middle has no occupied neighbours', () {
    var neighbourhood = emptyGrid.getNeighbours(1, 1);
    expect(neighbourhood.hasOccupiedNeighbor(1, 1), equals(false));
  });
}
