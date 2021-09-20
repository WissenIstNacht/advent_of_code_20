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
  test('Check that basic inputs middle position has occupied neighbours', () {
    expect(basicGrid.hasOccupiedNeighbor(1, 1), equals(true));
  });
  test('Check that dots input in middle position has no occupied neighbours',
      () {
    expect(floorGrid.hasOccupiedNeighbor(1, 1), equals(false));
  });
  test('Check that ls inputs middle position hasno  occupied neighbours', () {
    expect(emptyGrid.hasOccupiedNeighbor(1, 1), equals(false));
  });
}
