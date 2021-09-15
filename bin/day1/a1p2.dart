import 'package:avent_of_code/solver.dart';

class Day1Part2 extends Solver {
  Day1Part2() : super(1);

  @override
  String solve(List<String> input) {
    final expenses = input.map((e) => int.parse(e)).toList();

    for (var i = 0; i < expenses.length; i++) {
      for (var j = i; j < expenses.length; j++) {
        for (var k = j + 1; k < expenses.length; k++) {
          if (expenses[i] + expenses[j] + expenses[k] == 2020) {
            return (expenses[i] * expenses[j] * expenses[k]).toString();
          }
        }
      }
    }

    throw NullThrownError();
  }
}
