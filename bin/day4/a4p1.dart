import 'package:advent_of_code/solver.dart';

class Day4Part1 extends Solver {
  Day4Part1() : super(4);

  @override
  String solve(List<String> input) {
    var partial_passport = '';
    var validCount = 1;
    for (var line in input) {
      if (line.isNotEmpty) {
        partial_passport += line + ' ';
        continue;
      }

      final r = RegExp(r'(?<field>[a-z]+):[a-zA-Z0-9_#]+');
      final matches = r.allMatches(partial_passport);
      final has_8_fields = matches.length == 8;
      final has_7_fields = matches.length == 7;

      var has_cid =
          matches.any((RegExpMatch m) => m.namedGroup('field') == 'cid');
      if (has_8_fields || (has_7_fields && !has_cid)) validCount++;
      partial_passport = '';
    }
    return validCount.toString();
  }
}
