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

  for (var i = 0; i < lines.length; i++) {
    var line = lines[i];
    // acc commands do not require checking.
    if (line.startsWith('acc')) {
      continue;
    }
    var v = 1;

    lines[i] = line.replaceFirstMapped(RegExp(r'(?:nop|jmp)'), (match) {
      return match.group(0) == 'jmp' ? 'nop' : 'jmp';
    });

    final interpreter = Interpreter(lines);
    res = interpreter.run();
    if (interpreter.ended_normally) {
      break;
    } else {
      lines[i] = line;
    }
  }

  print(res);
}

/*===== AUX ============================================================================*/

class Interpreter {
  int accumulator = 0;
  int curr_command = 0;
  bool ended_normally = false;

  List<bool> used;
  List<String> program;

  RegExp command_parser = RegExp(r'^(?<op>nop|acc|jmp) (?<arg>[+-]\d+)$');

  Interpreter(this.program) : used = List<bool>(program.length);

  int run() {
    do {
      used[curr_command] = true;
      evaluate(program[curr_command]);
    } while (!_is_done());
    return accumulator;
  }

  bool _is_done() {
    if (curr_command >= program.length) {
      ended_normally = true;
      return true;
    } else {
      return used[curr_command] ?? false;
    }
  }

  /// Sets the new values for both the accumulator and the current_command.
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
