import 'package:avent_of_code/solver.dart';
import 'Group.dart';

class Day6Part1 extends Solver {
  Day6Part1() : super(6);

  @override
  String solve(List<String> input) {
    var sum = 0;
    final groupMaker = GroupMaker(input);

    var group = groupMaker.next();
    while (!(group is EmptyGroup)) {
      sum += evaluateGroupExists(group);
      group = groupMaker.next();
    }
    return sum.toString();
  }

  int evaluateGroupExists(Group group) {
    var indicator = List.filled(26, false);
    var answers = group.content;
    for (var r in answers.runes) {
      final alphabet_pos = r - 97;
      indicator[alphabet_pos] |= true;
    }
    // return number of indicators set to true
    final no_answered = indicator.where((i) => i).length;
    return no_answered;
  }
}
