import 'advent_of_code.dart';

/*===== PART 1 =========================================================================*/

void solve1() {
  var jolts = parseInput(10, false).map((s) => int.parse(s)).toList();
  jolts.sort();
  var diff1 = 0;
  var diff3 = 0;

  // source difference (from outlet to first adapter.)
  switch (jolts.first) {
    case 1:
      diff1++;
      break;
    case 3:
      diff3++;
      break;
    default:
      break;
  }

  for (var i = 0; i < jolts.length - 1; i++) {
    if (jolts[i] + 1 == jolts[i + 1]) diff1++;
    if (jolts[i] + 3 == jolts[i + 1]) diff3++;
  }

  diff3++; // 3 jolts difference to device.
  var res = diff1 * diff3;
  print(res);
}

/*===== PART 2 =========================================================================*/

void solve2() {}
