import 'package:advent_of_code/solver.dart';

class Day9Part2 extends Solver {
  Day9Part2() : super(9);

  @override
  String solve(List<String> input) {
    final intInput = input.map((s) => int.parse(s)).toList();
    final res = findRange(intInput, 25);

    return res.toString();
  }

  int findRange(List<int> data, int pre) {
    var lo = 0, hi = 0, sum = 0;
    var target = 14144619;

    while (hi < data.length) {
      if (sum < target) {
        //sum too small, grow contiguous region
        sum += data[hi];
        hi++;
      } else if (sum > target) {
        //sum too large, shrink contiguous region
        sum -= data[lo];
        lo++;
      } else {
        final sub = data.sublist(lo, hi);
        sub.sort();
        return sub.first + sub.last;
      }
    }
    return -1; // shouldn't reach this.
  }
}
