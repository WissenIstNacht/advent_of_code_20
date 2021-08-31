class PasswordPolicy {
  static explicit(String line) {
    var i = 0;
    var sub = '';

    while (line[i] != '-') {
      sub += line[i];
      i++;
    }
    i++;
    final a = int.parse(sub);
    sub = '';
    while (line[i] != ' ') {
      sub += line[i];
      i++;
    }
    final b = int.parse(sub);
    i++;
    final c = line[i];
    i += 3;
    var password = '';
    while (i < line.length) {
      password += line[i];
      i++;
    }
    return PasswordParameters(a, b, c, password);
  }

  static PasswordParameters regex(String line) {
    final regex = RegExp(r'^([0-9]+)-([0-9]+) ([a-z]): ([a-zA-Z]+)$');
    final matches = regex.allMatches(line).elementAt(0);

    return PasswordParameters(
      int.parse(matches.group(1) ?? "-1"),
      int.parse(matches.group(2) ?? "-1"),
      matches.group(3) ?? "hey",
      matches.group(4) ?? "hey",
    );
  }
}

class PasswordParameters {
  int a, b;
  String c, password;

  PasswordParameters(this.a, this.b, this.c, this.password);
}
