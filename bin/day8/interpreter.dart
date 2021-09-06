class Interpreter {
  int accumulator = 0;
  int curr_command = 0;
  bool ended_normally = false;

  List<bool> used;
  List<String> program;

  RegExp command_parser = RegExp(r'^(?<op>nop|acc|jmp) (?<arg>[+-]\d+)$');

  Interpreter(this.program) : used = List.filled(program.length, false);

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
      return used[curr_command];
    }
  }

  /// Sets the new values for both the accumulator and the current_command.
  void evaluate(String command) {
    final match = command_parser.firstMatch(command);
    final op = match?.namedGroup('op');
    final arg = int.parse(match?.namedGroup('arg') ?? "");

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
