import 'package:avent_of_code/solver.dart';
import 'bagPolicy.dart';

class Day7Part2 extends Solver {
  Day7Part2() : super(7);

  @override
  String solve(List<String> input) {
    final rules = <String, List<RuleObject>>{};
    input.forEach((line) {
      final rule = BagPolicy.parseRule(line);
      rules[rule.subject] = rule.objects;
    });

    final res = countBags(rules, 'shiny gold');

    return (res - 1).toString();
  }

  int countBags(Rules rules, String color) {
    var containedBags = rules[color]; //necessary for null checking
    if (containedBags == null) return 0;
    if (containedBags.isEmpty) return 1;

    var no_bags = 1;
    for (var bags in containedBags) {
      no_bags += bags.amount * countBags(rules, bags.color);
    }
    return no_bags;
  }
}
