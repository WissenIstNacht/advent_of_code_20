import '../lib/executor.dart';
import "../src/ax.dart";

void main(List<String> arguments) {
  var solver = Solver42f();
  Executor.execute(solver);
}
