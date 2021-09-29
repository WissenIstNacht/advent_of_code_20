import 'package:test/test.dart';
import 'dart:io';

import '../../../bin/day11/grid.dart';

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
    final curr = diamondGrid.toInts();
    diamondGrid.step();
    final next = diamondGrid.toInts();
    expect(next, equals(curr));
  });
  test('Empty grid becomes full grid after step', () {
    emptyGrid.step();
    final curr = emptyGrid.toInts();
    final next = fullGrid.toInts();
    expect(curr, equals(next));
  });
  test('Full grid cross after step', () {
    fullGrid.step();
    final curr = fullGrid.toInts();
    final next = [
      [1, 2, 1],
      [2, 2, 2],
      [1, 2, 1]
    ];
    expect(curr, equals(next));
  });
}
