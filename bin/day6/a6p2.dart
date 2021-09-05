import '../../lib/solver.dart';

class Day6Part2 extends Solver {
  Day6Part2() : super(6);

  @override
  String solve(List<String> input) {
    var sum = 0;
    var group = '';
    var group_size = 0;
    for (var line in input) {
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
    return sum.toString();
  }

  int evaluateGroupAll(String answers, int group_size) {
    var indicator = List.filled(26, 0);
    for (var r in answers.runes) {
      final alphabet_pos = r - 97;
      indicator[alphabet_pos]++;
    }
    final answeredCount = indicator.where((i) => i == group_size).length;
    return answeredCount;
  }
}
