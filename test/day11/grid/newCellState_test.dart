import 'package:test/test.dart';
import 'dart:io';

import '../../../bin/day11/grid.dart';

void main() {
  late Grid basicGrid, emptyGrid, fullGrid, diamondGrid;
  setUp(() {
    var lines = File('test/day11/inputs/basicInput').readAsLinesSync();
    basicGrid = Grid.fromList(lines);
    lines = File('test/day11/inputs/lsInput').readAsLinesSync();
    emptyGrid = Grid.fromList(lines);
    lines = File('test/day11/inputs/hashtagsInput').readAsLinesSync();
    fullGrid = Grid.fromList(lines);
    lines = File('test/day11/inputs/diamondInput').readAsLinesSync();
    diamondGrid = Grid.fromList(lines);
  });
  test('Basic input middle does not change', () {
    expect(basicGrid.newCellState(1, 1), equals(0));
  });
  test('Basic input bottom left does not change', () {
    expect(basicGrid.newCellState(2, 0), equals(0));
  });
  test('Basic input top right does not change', () {
    expect(basicGrid.newCellState(0, 2), equals(0));
  });
  test('Empty input middle changes', () {
    expect(emptyGrid.newCellState(1, 1), equals(1));
  });
  test('Empty input top left changes', () {
    expect(emptyGrid.newCellState(0, 0), equals(1));
  });
  test('Empty input top middle changes', () {
    print(emptyGrid.newCellState(0, 1));
    expect(emptyGrid.newCellState(0, 1), equals(1));
  });
  test('Full input top left does not change', () {
    expect(fullGrid.newCellState(0, 0), equals(0));
  });
  test('Full input middle does change', () {
    expect(fullGrid.newCellState(1, 1), equals(2));
  });
  test('Full input top middle does change', () {
    expect(fullGrid.newCellState(0, 1), equals(2));
  });
  test('Diamond input top middle does change', () {
    expect(fullGrid.newCellState(0, 1), equals(2));
  });
}
