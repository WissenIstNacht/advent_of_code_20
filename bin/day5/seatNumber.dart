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
