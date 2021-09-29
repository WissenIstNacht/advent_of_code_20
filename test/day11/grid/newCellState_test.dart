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
    final oldState = basicGrid.matrix[1][1];
    final newState = basicGrid.newCellState(1, 1);
    expect(newState, equals(oldState));
  });
  test('Basic input bottom left does not change', () {
    final oldState = basicGrid.matrix[2][0];
    final newState = basicGrid.newCellState(2, 0);
    expect(newState, equals(oldState));
  });
  test('Basic input top right does not change', () {
    final oldState = basicGrid.matrix[0][2];
    final newState = basicGrid.newCellState(0, 2);
    expect(newState, equals(oldState));
  });
  test('Empty input middle changes', () {
    expect(emptyGrid.newCellState(1, 1), equals(CellType.occupied));
  });
  test('Empty input top left changes', () {
    expect(emptyGrid.newCellState(0, 0), equals(CellType.occupied));
  });
  test('Empty input top middle changes', () {
    print(emptyGrid.newCellState(0, 1));
    expect(emptyGrid.newCellState(0, 1), equals(CellType.occupied));
  });
  test('Full input top left does not change', () {
    final oldState = basicGrid.matrix[0][0];
    final newState = basicGrid.newCellState(0, 0);
    expect(newState, equals(oldState));
  });
  test('Full input middle does change', () {
    expect(fullGrid.newCellState(1, 1), equals(CellType.empty));
  });
  test('Full input top middle does change', () {
    expect(fullGrid.newCellState(0, 1), equals(CellType.empty));
  });
  test('Diamond input top middle does change', () {
    expect(fullGrid.newCellState(0, 1), equals(CellType.empty));
  });
}
