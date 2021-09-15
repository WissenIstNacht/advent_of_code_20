import 'package:advent_of_code/solver.dart';

class Day9Part1 extends Solver {
  Day9Part1() : super(9);

  @override
  String solve(List<String> input) {
    final intInput = input.map((s) => int.parse(s)).toList();
    final res = findInvalidNumber(intInput, 25);

    return res.toString();
  }

  int findInvalidNumber(List<int> data, int pre) {
    for (var i = pre; i < data.length; i++) {
      var curr_number = data[i];
      var valid = false;

      for (var j = i - 1; j > i - pre; j--) {
        for (var k = j - 1; k >= i - pre; k--) {
          var sum = data[k] + data[j];
          if (sum == curr_number) valid = true;
        }
      }
      if (!valid) return curr_number;
    }
    return -1; // shouldn't reach this.
  }
}
