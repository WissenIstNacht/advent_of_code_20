import 'package:advent_of_code/solver.dart';

import 'grid.dart';

class Day11Part2 extends Solver {
  Day11Part2() : super(11);

  @override
  String solve(List<String> input) {
    final officialGrid = Grid.fromList(input);
    while (officialGrid.step()) {}
    final res = officialGrid.occupiedSeatsCount();
    return res.toString();
  }
}
