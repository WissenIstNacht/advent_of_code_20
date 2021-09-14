import 'package:avent_of_code/solver.dart';
import 'PasswordPolicy.dart';

/*===== PART 1 =========================================================================*/

class Day2Part1 extends Solver {
  Day2Part1() : super(2);

  @override
  String solve(List<String> input) {
    final correctCount = input.where(isValidPassword).length;
    return correctCount.toString();
  }

  bool isValidPassword(String line) {
    var policy = PolicyParser.regex(line);
    var sum = 0;
    for (var i = 0; i < policy.password.length; i++) {
      if (policy.password[i] == policy.requiredChar) sum++;
    }
    return policy.minCount <= sum && sum <= policy.maxCount;
  }
}
