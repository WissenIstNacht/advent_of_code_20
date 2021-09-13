class DifferenceCounter {
  int delta;
  int count = 0;

  DifferenceCounter(this.delta);

  bool analyze(first, second) {
    if (second - first == delta) {
      count++;
      return true;
    }
    return false;
  }
}
