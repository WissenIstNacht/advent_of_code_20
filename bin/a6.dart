import 'advent_of_code.dart';

/*===== PART 1 =========================================================================*/

void solve1() {
  final lines = parseInput(6, false); // lines containing only a line break are empty!
  var sum = 0;

  var group = '';
  for (var line in lines) {
    if (line.isNotEmpty) {
      group += line;
    } else {
      //do something
      sum += evaluateGroupExists(group);
      group = '';
    }
  }
  print(sum);
}

int evaluateGroupExists(String answers) {
  var indicator = List.filled(26, false);
  for (var r in answers.runes) {
    final alphabet_pos = r - 97;
    indicator[alphabet_pos] |= true;
  }
  final no_answered = indicator.fold(0, (val, elem) {
    return (elem) ? ++val : val;
  });
  return no_answered;
}

/*===== PART 2 =========================================================================*/

void solve2() {
  final lines = parseInput(6, false); // lines containing only a line break are empty!
  var sum = 0;

  var group = '';
  var group_size = 0;
  for (var line in lines) {
    if (line.isNotEmpty) {
      group += line;
      group_size++;
    } else {
      //do something
      sum += evaluateGroupAll(group, group_size);
      group = '';
      group_size = 0;
    }
  }
  print(sum);
}

int evaluateGroupAll(String answers, int group_size) {
  var indicator = List.filled(26, 0);
  for (var r in answers.runes) {
    final alphabet_pos = r - 97;
    indicator[alphabet_pos]++;
  }
  final no_answered = indicator.fold(0, (val, elem) {
    return (elem == group_size) ? ++val : val;
  });
  return no_answered;
}
