import 'package:avent_of_code/solver.dart';
import 'Group.dart';

class Day6Part2 extends Solver {
  Day6Part2() : super(6);

  @override
  String solve(List<String> input) {
    var sum = 0;
    final groupMaker = new GroupMaker(input);

    var group = groupMaker.next();
    while (!(group is EmptyGroup)) {
      sum += evaluateGroupAll(group);
      group = groupMaker.next();
    }
    return sum.toString();
  }

  int evaluateGroupAll(Group group) {
    var indicator = List.filled(26, 0);
    var answers = group.content;

    for (var r in answers.runes) {
      final alphabet_pos = r - 97;
      indicator[alphabet_pos]++;
    }
    final answeredCount = indicator.where((i) => i == group.size).length;
    return answeredCount;
  }
}
