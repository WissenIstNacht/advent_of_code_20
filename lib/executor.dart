import 'solver.dart';
import 'utils.dart';

class Executor {
  static void execute(Solver solver) {
    var input = Utils.fetchInput(solver.day);
    var output = solver.solve(input);
    Utils.prettyPrint(output);
  }
}
