import 'advent_of_code.dart';

/*===== PART 1 =========================================================================*/

void solve1() {
  var res = 0;
  var lines = parseInput(8, false);

  final interpreter = Interpreter(lines);
  res = interpreter.run();

  print(res);
}

/*===== PART 2 =========================================================================*/

void solve2() {
  var res = 0;
  var lines = parseInput(8, false);

  final interpreter = Interpreter(lines);
  res = interpreter.run();

  print(res);
}

/*===== AUX ============================================================================*/

class Interpreter {
  int accumulator = 0;
  int curr_command = 0;

  List<bool> used;
  List<String> program;

  RegExp command_parser = RegExp(r'^(?<op>nop|acc|jmp) (?<arg>[+-]\d+)$');

  Interpreter(this.program) : used = List<bool>(program.length);

  int run() {
    // used[0] = true;
    do {
      used[curr_command] = true;
      evaluate(program[curr_command]);
    } while (!_is_done());
    return accumulator;
  }

  bool _is_done() {
    if (curr_command > program.length) return true;
    return used[curr_command] ?? false;
  }

  void evaluate(String command) {
    final match = command_parser.firstMatch(command);
    final op = match.namedGroup('op');
    final arg = int.parse(match.namedGroup('arg'));

    switch (op) {
      case 'nop':
        curr_command++;
        break;
      case 'acc':
        accumulator += arg;
        curr_command++;
        break;
      case 'jmp':
        curr_command += arg;
        break;
      default:
        break;
    }
  }
}
