import 'package:avent_of_code/solver.dart';

class Day10Part2 extends Solver {
  Day10Part2() : super(10);

  @override
  String solve(List<String> input) {
    final jolts = input.map((s) => int.parse(s)).toList();
    jolts.sort();
    final counter = <int>[];
    // insert socket as value 0 to jolts
    jolts.insert(0, 0);

    // counts for socket and first jolt are fixed
    counter.add(1);
    counter.add(1);

    // find count for second jolt manually
    var count = 0;
    if (inRange(jolts[0], jolts[2])) count += counter[0];
    if (inRange(jolts[1], jolts[2])) count += counter[1];
    counter.add(count);

    for (var i = 3; i < jolts.length; i++) {
      if (jolts[i] - jolts[i - 1] == 3) {
        counter.add(counter[i - 1]);
      } else {
        count = 0;
        // How many way were there to arange adapters up to 3 jolts smaller than
        // current?
        if (inRange(jolts[i - 1], jolts[i])) count += counter[i - 1];
        if (inRange(jolts[i - 2], jolts[i])) count += counter[i - 2];
        if (inRange(jolts[i - 3], jolts[i])) count += counter[i - 3];
        counter.add(count);
      }
    }
    return counter.last.toString();
  }

  bool inRange(parent, curr) => curr - parent <= 3;
}

// NOTE This solution is an instance of dynamic programming. The problem has a 
// recursive structure to it, where solving "smaller" parts of the recursion can
// help to solve the larger parts. Namely, one can find out how many ways there
// are to connect an adapter of a certain joltage, if one knows how many ways
// there are to connect an adapter of lower joltage. By using memoization, one
// can avoid recursion in this problem. Rather, one can find the solution by
// building "from the ground up". 

// The concrete idea is: The number of ways to connect adapter k is equal to
// the sum of all the number of ways to connect all adapter which can connect
// with adapter k. By keeping track of the counts for each adapter, on can thus
// simply sum the counts of the previous adapters. And since any adapter can
// only connect with adapters withing a range of 3 jolts, this means that one
// has to add up at most the last three counts.