import "../src/ax.dart";
import "../lib/utils.dart";

void main(List<String> arguments) {
  var solver = SolverX();
  var input = Utils.parseInput(1);
  var output = solver.solveFirst(input);
  Utils.prettyPrint(output);
}
