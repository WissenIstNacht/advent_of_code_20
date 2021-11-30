import 'package:test/test.dart';
import 'dart:io';

import '../../../bin/day11/grid.dart';
import '../../../bin/day11/grid_evolution.dart';

void main() {
  late Grid sampleGrid;
  setUp(() {
    var lines = File('test/day11/inputs/officialInput').readAsLinesSync();
    sampleGrid = Grid.fromList(lines);
  });
  test('The sample grid ends up with 37 occupied seats for the first problem',
      () {
    final evolver = Evolver1(sampleGrid);
    while (evolver.step()) {}
    final res = evolver.currGrid.occupiedSeatsCount();
    expect(res, equals(37));
  });
  test('The sample grid ends up with 26 occupied seats for the first problem',
      () {
    final evolver = Evolver2(sampleGrid);
    while (evolver.step()) {
      print(evolver.currGrid.toInts());
    }
    final res = evolver.currGrid.occupiedSeatsCount();
    expect(res, equals(26));
  });
}
