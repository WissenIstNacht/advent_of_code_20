import 'package:avent_of_code/solver.dart';

class Day4Part2 extends Solver {
  Day4Part2() : super(4);

  @override
  String solve(List<String> input) {
    var partial_passport = '';
    var validCount = 0;
    for (var line in input) {
      // A passport may stretch across several lines in the file. Accumulate them into one
      // line of string before processing them.
      if (line.isNotEmpty) {
        partial_passport += line + ' ';
      } else {
        if (checkValidity(partial_passport)) validCount++;
        partial_passport = '';
      }
    }
    return validCount.toString();
  }

  bool checkValidity(String passport) {
    // Returns between 1 and 8 matches, depending on the nr. fields per passport. Each
    // match corresponds to a field. Each match consists of 3 groups. One contains the
    // whole field, one contains the field's key 'k' and the other the value 'v'.
    final regex_row = RegExp(r'(?<k>[a-z]+):(?<v>[a-zA-Z0-9_#]+)');
    final matches = regex_row.allMatches(passport);

    final regex_pid = RegExp(r'^[0-9]{9}$');
    final regex_ecl = RegExp(r'^(?:amb|blu|brn|gry|grn|hzl|oth)$');
    final regex_hcl = RegExp(r'^#[0-9a-f]{6}$');
    final regex_xyr = RegExp(r'^[0-9]{4}$');
    final regex_hgt = RegExp(r'^(?<height>[0-9]{2,3})(?<unit>in|cm)$');

    //passport with less then 7 fields must be missing essential field -> invalid.
    if (matches.length < 7) return false;

    var has_cid = false;
    var has_error = false;
    for (var match in matches) {
      var key = match.namedGroup('k');
      var value = match.namedGroup('v') ?? "ﬁ";
      switch (key) {
        case 'cid':
          has_cid = true;
          break;
        case 'pid':
          if (!regex_pid.hasMatch(value)) has_error = true;
          break;
        case 'ecl':
          if (!regex_ecl.hasMatch(value)) has_error = true;
          break;
        case 'hcl':
          if (!regex_hcl.hasMatch(value)) has_error = true;
          break;
        case 'byr':
          // if the value is not picked up by the regexp, set it to something wrong.
          var year_match = regex_xyr.firstMatch(value)?.group(0) ?? '0';
          var year = int.parse(year_match);
          if (year < 1920 || 2002 < year) has_error = true;
          break;
        case 'iyr':
          var year_match = regex_xyr.firstMatch(value)?.group(0) ?? '0';
          var year = int.parse(year_match);
          if (year < 2010 || 2020 < year) has_error = true;
          break;
        case 'eyr':
          var year_match = regex_xyr.firstMatch(value)?.group(0) ?? '0';
          var year = int.parse(year_match);
          if (year < 2020 || 2030 < year) has_error = true;
          break;
        case 'hgt':
          var height_match = regex_hgt.firstMatch(value)?.group(1) ?? '0';
          var unit = regex_hgt.firstMatch(value)?.group(2) ?? 'cm';
          var height = int.parse(height_match);
          if (unit == 'cm' && (height < 150 || 193 < height)) has_error = true;
          if (unit == 'in' && (height < 59 || 76 < height)) has_error = true;
          break;
        default:
          break;
      }
      if (has_error) break;
    }
    if (has_error) return false;
    if (has_cid && matches.length == 7) return false;
    return true;
  }
}
