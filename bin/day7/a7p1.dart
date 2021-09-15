import 'package:advent_of_code/solver.dart';
import 'bagPolicy.dart';

/*===== PART 1 =========================================================================*/

class Day7Part1 extends Solver {
  Day7Part1() : super(7);

  @override
  String solve(List<String> input) {
    final Rules rules = {};
    input.forEach((line) {
      final rule = BagPolicy.parseRule(line);
      rules[rule.subject] = rule.objects;
    });

    var res = rules.keys.where((k) => searchGold(rules, k));
    return res.length.toString();
  }

  bool searchGold(Rules rules, String color) {
    var containedBags = rules[color]; //necessary for null checking
    if (containedBags == null) return false;
    if (containedBags.any((b) => b.color == "shiny gold")) return true;

    for (var cb in containedBags) {
      if (searchGold(rules, cb.color)) return true;
    }
    return false;
  }
}
