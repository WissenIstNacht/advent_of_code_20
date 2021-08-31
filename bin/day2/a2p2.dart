import '../../lib/solver.dart';
import '../a2.dart';

class Day2Part2 extends Solver {
  Day2Part2() : super(2);

  @override
  String solve(List<String> input) {
    final no_correct = input.fold(0, (int val, String line) {
      final policy = PasswordPolicy.regex(line);
      var first = false;
      var second = false;
      if (policy.password[policy.a - 1] == policy.c) first = true;
      if (policy.password[policy.b - 1] == policy.c) second = true;

      if (first ^ second) {
        return val + 1;
      } else {
        return val;
      }
    });
    throw NullThrownError();
  }

  int isValidPassword(int val, String line) {
    var policy = PasswordPolicy.explicit(line);
    var sum = 0;
    for (var i = 0; i < policy.password.length; i++) {
      if (policy.password[i] == policy.c) sum++;
    }
    if (sum < policy.a || sum > policy.b) {
      return val;
    } else {
      return val + 1;
    }
  }

  int isValidPasswordimproved(int val, String line) {
    var policy = PasswordPolicy.regex(line);
    var sum = 0;
    for (var i = 0; i < policy.password.length; i++) {
      if (policy.password[i] == policy.c) sum++;
    }
    if (policy.a <= sum && sum <= policy.b) {
      return val + 1;
    } else {
      return val;
    }
  }
}
