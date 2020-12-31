import 'advent_of_code.dart';

/*===== PART 1 =========================================================================*/

void solve1() {
  var lines = parseInput(9, false).map((s) => int.parse(s)).toList();
  var res = findInvalidNumber(lines, 25);

  print(res);
}

int findInvalidNumber(List<int> data, int pre) {
  for (var i = pre; i < data.length; i++) {
    var curr_number = data[i];
    var valid = false;

    for (var j = i - 1; j > i - pre; j--) {
      for (var k = j - 1; k >= i - pre; k--) {
        var sum = data[k] + data[j];
        if (sum == curr_number) valid = true;
      }
    }
    if (!valid) return curr_number;
  }
  return -1; // shouldn't reach this.
}

/*===== PART 2 =========================================================================*/

void solve2() {
  var lines = parseInput(9, false).map((s) => int.parse(s)).toList();
  var res = findRange(lines, 25);
  print(res);
}

int findRange(List<int> data, int pre) {
  var found = false;
  var lo = 0, hi = 0, sum = 0;
  var target = 14144619;

  while (hi < data.length) {
    if (sum < target) {
      //sum too small, grow contiguous region
      sum += data[hi];
      hi++;
    } else if (sum > target) {
      //sum too large, shrink contiguous region
      sum -= data[lo];
      lo++;
    } else {
      final sub = data.sublist(lo, hi);
      sub.sort();
      return sub.first + sub.last;
    }
  }
  return -1; // shouldn't reach this.
}
