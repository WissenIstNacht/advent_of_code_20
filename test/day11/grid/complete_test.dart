import 'package:test/test.dart';
import 'dart:io';

import '../../../bin/day11/grid.dart';
import '../../../bin/day11/grid_evolution.dart';

void main() {
  late Grid officialGrid;
  late GridEvolver evolver;
  setUp(() {
    var lines = File('test/day11/inputs/officialInput').readAsLinesSync();
    officialGrid = Grid.fromList(lines);
    evolver = GridEvolver(officialGrid);
  });
  test('The official grid ends up with 37 occupied seats', () {
    while (evolver.step()) {}
    final res = evolver.currGrid.occupiedSeatsCount();
    expect(res, equals(37));
  });
}
