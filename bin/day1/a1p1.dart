import 'dart:io';
import '../../lib/solver.dart';

class Day1Part1 extends Solver {
  Day1Part1() : super(1);

  @override
  String solve(List<String> input) {
    final expenses = input.map((e) => int.parse(e)).toList();

    for (var i = 0; i < expenses.length; i++) {
      for (var j = i; j < expenses.length; j++) {
        if (expenses[i] + expenses[j] == 2020)
          return (expenses[i] * expenses[j]).toString();
      }
    }

    throw NullThrownError();
  }

  void improved1() {
    final lines = File('inputs\\i1.txt').readAsLinesSync();
    final expenses = lines.map((e) => int.parse(e)).toList();
    expenses.sort();
    var lo = 0, hi = expenses.length - 1;

    var found = false;
    while (!found) {
      if (expenses[lo] + expenses[hi] == 2020) {
        found = true;
      } else if (expenses[lo] + expenses[hi] > 2020) {
        hi--;
      } else {
        lo++;
      }
    }
    var e1 = expenses[lo], e2 = expenses[hi];
    print('Found expenses that up to 2020 at indeces $lo and $hi.');
    print('Their values are $e1 and $e2');
    print('Their product is ${e1 * e2}');
  }
}
