import '../../lib/solver.dart';

class Day3Part2 extends Solver {
  Day3Part2() : super(3);

  @override
  String solve(List<String> input) {
    var itineraries = <Itinerary>[
      Itinerary(1),
      Itinerary(3),
      Itinerary(5),
      Itinerary(7),
    ];

    for (var k = 1; k < input.length; k++) {
      var line = input[k];
      itineraries.forEach((i) {
        i.next();
        if (line[i.curr_x] == '#') i.hit();
      });
    }

    var total =
        itineraries.fold(1, (int no_trees, i) => no_trees * i.trees_hit);

    var double_y = Itinerary(1);
    for (var k = 2; k < input.length; k += 2) {
      var line = input[k];
      double_y.next();
      if (line[double_y.curr_x] == '#') double_y.hit();
    }

    return (total * double_y.trees_hit).toString();
  }
}

class Itinerary {
  int slope_x;
  int curr_x = 0;
  int trees_hit = 0;
  int width = 31;

  Itinerary(this.slope_x);

  void next() {
    curr_x = (curr_x + slope_x) % width;
  }

  void hit() {
    trees_hit += 1;
  }
}
