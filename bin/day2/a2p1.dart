import 'dart:io';

import '../../lib/solver.dart';
import '../a2.dart';

/*===== PART 1 =========================================================================*/

class Day2Part1 extends Solver {
  Day2Part1() : super(2);

  @override
  String solve(List<String> input) {
    final no_correct = input.fold(0, isValidPasswordimproved);
    return no_correct.toString();
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
