import 'solver.dart';
import 'utils.dart';

class Executor {
  static void execute(Solver solver) {
    var input = Utils.readInput(solver.day);
    var output = solver.solve(input);
    Utils.prettyPrint(output);
  }
}
