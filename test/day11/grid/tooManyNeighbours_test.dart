import 'package:test/test.dart';
import 'dart:io';

import '../../../bin/day11/grid.dart';

void main() {
  late Grid basicGrid, fullGrid, diamondGrid;
  setUp(() {
    var lines = File('test/day11/inputs/basicInput').readAsLinesSync();
    basicGrid = Grid.fromList(lines);
    lines = File('test/day11/inputs/hashtagsInput').readAsLinesSync();
    fullGrid = Grid.fromList(lines);
    lines = File('test/day11/inputs/diamondInput').readAsLinesSync();
    diamondGrid = Grid.fromList(lines);
  });
  test('Basic input middle does not have too many occupied neighbours', () {
    var neighbourhood = basicGrid.getNeighbours(1, 1);
    expect(neighbourhood.hasTooManyNeighbors(1, 1, 4), equals(false));
  });
  test('Basic input top left does not have too many occupied neighbours', () {
    var neighbourhood = basicGrid.getNeighbours(0, 2);
    expect(neighbourhood.hasTooManyNeighbors(0, 2, 4), equals(false));
  });
  test('Full input middle has too many occupied neighbours', () {
    var neighbourhood = fullGrid.getNeighbours(1, 1);
    expect(neighbourhood.hasTooManyNeighbors(1, 1, 4), equals(true));
  });
  test('Full input top left does not have too many occupied neighbours', () {
    var neighbourhood = fullGrid.getNeighbours(0, 0);
    expect(neighbourhood.hasTooManyNeighbors(0, 0, 4), equals(false));
  });
  test('Diamond input middle has too many occupied neighbours', () {
    var neighbourhood = diamondGrid.getNeighbours(1, 1);
    expect(neighbourhood.hasTooManyNeighbors(1, 1, 4), equals(true));
  });
  test('Diamond input top left does not have too many occupied neighbours', () {
    var neighbourhood = diamondGrid.getNeighbours(0, 0);
    expect(neighbourhood.hasTooManyNeighbors(0, 0, 4), equals(false));
  });
  test('Diamond input top middle does not have too many occupied neighbours',
      () {
    var neighbourhood = diamondGrid.getNeighbours(0, 1);
    expect(neighbourhood.hasTooManyNeighbors(0, 1, 4), equals(false));
  });
}
