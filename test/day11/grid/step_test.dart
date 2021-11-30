import 'package:test/test.dart';
import 'dart:io';

import '../../../bin/day11/grid.dart';
import '../../../bin/day11/grid_evolution.dart';

void main() {
  late Grid emptyGrid, fullGrid, diamondGrid;
  setUp(() {
    var lines = File('test/day11/inputs/lsInput').readAsLinesSync();
    emptyGrid = Grid.fromList(lines);
    lines = File('test/day11/inputs/hashtagsInput').readAsLinesSync();
    fullGrid = Grid.fromList(lines);
    lines = File('test/day11/inputs/diamondInput').readAsLinesSync();
    diamondGrid = Grid.fromList(lines);
  });
  test('Diamond grid does not change on step', () {
    final ge = Evolver1(diamondGrid);
    final curr = ge.currGrid.toInts();
    ge.step();
    final next = ge.currGrid.toInts();
    expect(next, equals(curr));
  });
  test('Empty grid becomes full grid after step', () {
    final ge = Evolver1(emptyGrid);
    ge.step();
    final curr = ge.currGrid.toInts();
    final next = fullGrid.toInts();
    expect(curr, equals(next));
  });
  test('Full grid becomes cross after step', () {
    final ge = Evolver1(fullGrid);
    ge.step();
    final curr = ge.currGrid.toInts();
    final next = [
      [1, 2, 1],
      [2, 2, 2],
      [1, 2, 1]
    ];
    expect(curr, equals(next));
  });
}
