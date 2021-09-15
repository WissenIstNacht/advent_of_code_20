import 'package:advent_of_code/solver.dart';

class Day3Part1 extends Solver {
  int slope = 3;
  int curr_x = 0;
  int width = 11;

  Day3Part1() : super(3);

  @override
  String solve(List<String> input) {
    input.removeAt(0);
    width = input.first.length;
    final treeCount = input.fold(0, countTrees);
    return treeCount.toString();
  }

  int countTrees(int no_trees, String line) {
    var next_x = (curr_x + slope) % width;
    curr_x = next_x;
    if (line[next_x] == '#') {
      return no_trees + 1;
    } else {
      return no_trees;
    }
  }
}
