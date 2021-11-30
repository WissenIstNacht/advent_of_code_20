import 'package:test/test.dart';
import 'dart:io';

import '../../../bin/day11/cell.dart';
import '../../../bin/day11/grid.dart';
import '../../../bin/day11/grid_evolution.dart';

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
    final evolver = Evolver1(basicGrid);
    final oldState = evolver.getGrid().getCell(1, 1);
    final newState = evolver.newCellState(1, 1);
    expect(newState.state, equals(oldState.state));
  });
  test('Basic input bottom left does not change', () {
    final evolver = Evolver1(basicGrid);
    final oldState = evolver.getGrid().getCell(0, 2);
    final newState = evolver.newCellState(0, 2);
    expect(newState.state, equals(oldState.state));
  });
  test('Basic input top right does not change', () {
    final evolver = Evolver1(basicGrid);
    final oldState = evolver.getGrid().getCell(0, 2);
    final newState = evolver.newCellState(0, 2);
    expect(newState.state, equals(oldState.state));
  });
  test('Empty input middle changes', () {
    final evolver = Evolver1(emptyGrid);
    final newState = evolver.newCellState(1, 1).state;
    expect(newState, equals(CellType.occupied));
  });
  test('Empty input top left changes', () {
    final evolver = Evolver1(emptyGrid);
    final newState = evolver.newCellState(0, 0).state;
    expect(newState, equals(CellType.occupied));
  });
  test('Empty input top middle changes', () {
    final evolver = Evolver1(emptyGrid);
    final newState = evolver.newCellState(0, 1).state;
    expect(newState, equals(CellType.occupied));
  });
  test('Full input top left does not change', () {
    final evolver = Evolver1(basicGrid);
    final oldState = evolver.getGrid().getCell(0, 0).state;
    final newState = evolver.newCellState(0, 0).state;
    expect(newState, equals(oldState));
  });
  test('Full input middle does change', () {
    final evolver = Evolver1(fullGrid);
    final newState = evolver.newCellState(1, 1).state;
    expect(newState, equals(CellType.empty));
  });
  test('Full input top middle does change', () {
    final evolver = Evolver1(fullGrid);
    final newState = evolver.newCellState(0, 1).state;
    expect(newState, equals(CellType.empty));
  });
}
