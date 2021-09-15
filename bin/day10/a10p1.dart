import 'package:advent_of_code/solver.dart';
import 'Difference.dart';

class Day10Part1 extends Solver {
  Day10Part1() : super(10);

  @override
  String solve(List<String> input) {
    var jolts = input.map((s) => int.parse(s)).toList();
    jolts.sort();
    final diff1 = DifferenceCounter(1);
    final diff3 = DifferenceCounter(3);

    int neighbourReducer(int prev, int elem) {
      if (diff1.analyze(prev, elem)) {
      } else if (diff3.analyze(prev, elem)) {}
      return elem;
    }

    //outlet to first covered by initial value being 0
    jolts.fold(0, neighbourReducer);
    //last to device is a 3-difference
    diff3.count++;

    final res = diff1.count * diff3.count;
    return res.toString();
  }
}
