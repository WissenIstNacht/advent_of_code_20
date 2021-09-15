import 'package:advent_of_code/solver.dart';
import 'interpreter.dart';

class Day8Part1 extends Solver {
  Day8Part1() : super(8);

  @override
  String solve(List<String> input) {
    final interpreter = Interpreter(input);
    final res = interpreter.run();

    return res.toString();
  }
}
