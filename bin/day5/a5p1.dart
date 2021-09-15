import 'dart:math';

import 'package:advent_of_code/solver.dart';
import 'seatNumber.dart';

class Day5Part1 extends Solver {
  Day5Part1() : super(5);

  @override
  String solve(List<String> input) {
    final res = input.map(toSeatNumber).reduce(max);
    return res.toString();
  }
}
