import 'dart:io';

/*===== PART 1 =========================================================================*/

void solve1() {
  final lines = File('inputs\\i2.txt').readAsLinesSync();
  final no_correct = lines.fold(0, isValidPasswordimproved);
  print(no_correct);
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

/*===== PART 2 =========================================================================*/

void solve2() {
  final lines = File('inputs\\i2.txt').readAsLinesSync();
  final no_correct = lines.fold(0, (int val, String line) {
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
  print(no_correct);
}

class PasswordPolicy {
  int a, b;
  String c, password;

  PasswordPolicy.explicit(String line) {
    var i = 0;
    var sub = '';
    while (line[i] != '-') {
      sub += line[i];
      i++;
    }
    i++;
    a = int.parse(sub);
    sub = '';
    while (line[i] != ' ') {
      sub += line[i];
      i++;
    }
    b = int.parse(sub);
    i++;
    c = line[i];
    i += 3;
    password = '';
    while (i < line.length) {
      password += line[i];
      i++;
    }
  }

  PasswordPolicy.regex(String line) {
    final regex = RegExp(r'^([0-9]+)-([0-9]+) ([a-z]): ([a-zA-Z]+)$');
    final matches = regex.allMatches(line).elementAt(0);
    a = int.parse(matches.group(1));
    b = int.parse(matches.group(2));
    c = matches.group(3);
    password = matches.group(4);
  }
}
