import 'package:avent_of_code/solver.dart';
import 'PasswordPolicy.dart';

class Day2Part2 extends Solver {
  Day2Part2() : super(2);

  @override
  String solve(List<String> input) {
    final correctCount = input.where(isValidPassword).length;
    return correctCount.toString();
  }

  bool isValidPassword(String line) {
    final policy = PolicyParser.regex(line);
    var first = false;
    var second = false;
    if (policy.password[policy.minCount - 1] == policy.requiredChar)
      first = true;
    if (policy.password[policy.maxCount - 1] == policy.requiredChar)
      second = true;
    return first ^ second;
  }
}
