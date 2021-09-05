import '../../lib/solver.dart';

class Day6Part1 extends Solver {
  Day6Part1() : super(6);

  @override
  String solve(List<String> input) {
    var sum = 0;
    var group = '';
    for (var line in input) {
      if (line.isNotEmpty) {
        group += line;
      } else {
        //do something
        sum += evaluateGroupExists(group);
        group = '';
      }
    }
    return sum.toString();
  }

  int evaluateGroupExists(String answers) {
    var indicator = List.filled(26, false);
    for (var r in answers.runes) {
      final alphabet_pos = r - 97;
      indicator[alphabet_pos] |= true;
    }
    // return number of indicators set to true
    final no_answered = indicator.where((i) => i).length;
    return no_answered;
  }
}
