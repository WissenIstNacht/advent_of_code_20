import 'package:avent_of_code/solver.dart';
import 'interpreter.dart';

class Day8Part2 extends Solver {
  Day8Part2() : super(8);

  @override
  String solve(List<String> input) {
    var res = 0;
    for (var i = 0; i < input.length; i++) {
      var line = input[i];
      // acc commands do not require checking.
      if (line.startsWith('acc')) {
        continue;
      }

      input[i] = line.replaceFirstMapped(RegExp(r'(?:nop|jmp)'), (match) {
        return match.group(0) == 'jmp' ? 'nop' : 'jmp';
      });

      final interpreter = Interpreter(input);
      res = interpreter.run();
      if (interpreter.ended_normally) {
        break;
      } else {
        input[i] = line;
      }
    }
    return res.toString();
  }
}
