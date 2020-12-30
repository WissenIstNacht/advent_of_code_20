import 'dart:math';

import 'advent_of_code.dart';

/*===== PART 1 =========================================================================*/

void solve1() {
  final lines = parseInput(5, false); // lines containing only a line break are empty!
  var res = lines.map(toSeatNumber).reduce(max);
  print(res);
}

int toSeatNumber(String seatCode) {
  var row = 0, col = 0;
  var bits = 64;
  var i = 0;
  for (i; i < 7; i++) {
    if (seatCode[i] == 'B') row += bits;
    bits >>= 1;
  }

  bits = 4;
  for (i; i < 10; i++) {
    if (seatCode[i] == 'R') col += bits;
    bits >>= 1;
  }

  return row * 8 + col;
}

/*===== PART 2 =========================================================================*/

void solve2() {
  final lines = parseInput(5, false); // lines containing only a line break are empty!
  var seat_ids = lines.map(toSeatNumber).toList()..sort();

  for (var i = 0; i < seat_ids.length - 1; i++) {
    if (seat_ids[i + 1] - seat_ids[i] > 1) print(seat_ids[i] + 1);
  }
}
