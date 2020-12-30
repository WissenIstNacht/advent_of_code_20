import 'advent_of_code.dart';

/*===== PART 1 =========================================================================*/

void solve1() {
  final lines = parseInput(7, false);
  final line_regex = RegExp(
      r'^(?<container_col>\w+ \w+) bags contain (?:(?<some>(?:\d+ \w+ \w+ bags?,?\s?)+)|(?<none>no other bags)).$');
  final object_regex = RegExp(r'(?<number>\d+) (?<color>\w+ \w+)');

  var res = 0;
  final colors = <String, List<String>>{};
  for (var line in lines) {
    final match = line_regex.firstMatch(line);
    final rule_subj = match.namedGroup('container_col');
    final rule_obj = match.namedGroup('some') ?? match.namedGroup('none');

    if (rule_obj == 'no other bags') {
      colors[rule_subj] = <String>[];
    } else {
      final matches = object_regex.allMatches(rule_obj);
      final new_list = matches.map((m) => m.namedGroup('color')).toList();
      colors[rule_subj] = new_list;
    }
  }

  for (var k in colors.keys) {
    if (searchGold(colors, k)) res++;
  }
  print(res);
}

bool searchGold(Map<String, List<String>> rules, String color) {
  if (rules[color].isEmpty) return false;
  if (rules[color].contains('shiny gold')) return true;

  for (var c in rules[color]) {
    if (searchGold(rules, c)) return true;
  }
  return false;
}

/*===== PART 2 =========================================================================*/

void solve2() {
  final lines = parseInput(7, false); // lines containing only a line break are empty!
  final line_regex = RegExp(
      r'^(?<container_col>\w+ \w+) bags contain (?:(?<some>(?:\d+ \w+ \w+ bags?,?\s?)+)|(?<none>no other bags)).$');
  final object_regex = RegExp(r'(?<number>\d+) (?<color>\w+ \w+)');

  var res = 0;
  final rules = <String, List<ContainedBag>>{};
  for (var line in lines) {
    final match = line_regex.firstMatch(line);
    final container = match.namedGroup('container_col');
    final containee = match.namedGroup('some') ?? match.namedGroup('none');

    if (containee == 'no other bags') {
      rules[container] = [];
    } else {
      final matches = object_regex.allMatches(containee);
      final new_list = matches
          .map((m) => ContainedBag(m.namedGroup('number'), m.namedGroup('color')))
          .toList();
      rules[container] = new_list;
    }
  }

  res = countBags(rules, 'shiny gold');
  print(res - 1);
}

int countBags(Map<String, List<ContainedBag>> rules, String color) {
  if (rules[color].isEmpty) return 1;

  var no_bags = 1;
  for (var bags in rules[color]) {
    no_bags += bags.amount * countBags(rules, bags.color);
  }
  return no_bags;
}

class ContainedBag {
  int amount;
  String color;

  ContainedBag(amount, this.color) {
    this.amount = int.parse(amount);
  }
}
