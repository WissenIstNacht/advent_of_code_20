import 'package:test/test.dart';
import 'dart:io';

import '../../../bin/day11/grid.dart';

void main() {
  late Grid officialGrid;
  setUp(() {
    var lines = File('test/day11/inputs/officialInput').readAsLinesSync();
    officialGrid = Grid.fromList(lines);
  });
  test('The official grid ends up with 37 occupied seats', () {
    while (officialGrid.step()) {}
    final res = officialGrid.occupiedSeats();
    expect(res, equals(37));
  });
}
