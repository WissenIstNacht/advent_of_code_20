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
    expect(basicGrid.hasTooManyNeighbors(1, 1), equals(false));
  });
  test('Basic input top left does not have too many occupied neighbours', () {
    expect(basicGrid.hasTooManyNeighbors(0, 2), equals(false));
  });
  test('Full input middle has too many occupied neighbours', () {
    expect(fullGrid.hasTooManyNeighbors(1, 1), equals(true));
  });
  test('Full input top left has too many occupied neighbours', () {
    expect(fullGrid.hasTooManyNeighbors(0, 0), equals(false));
  });
  test('Diamond input middle has too many occupied neighbours', () {
    expect(diamondGrid.hasTooManyNeighbors(1, 1), equals(true));
  });
  test('Diamond input top left has too many occupied neighbours', () {
    expect(diamondGrid.hasTooManyNeighbors(0, 0), equals(false));
  });
}
