import 'package:advent_of_code/solver.dart';

import 'grid.dart';
import 'grid_evolution.dart';

class Day11Part2 extends Solver {
  Day11Part2() : super(11);

  @override
  String solve(List<String> input) {
    final officialGrid = Grid.fromList(input);
    print(officialGrid.toInts());
    final evolver = Evolver2(officialGrid);

    while (evolver.step()) {}
    final res = evolver.currGrid.occupiedSeatsCount();
    return res.toString();
  }
}
