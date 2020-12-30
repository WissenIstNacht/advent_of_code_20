import 'dart:io';

/*===== PART 1 =========================================================================*/

int slope = 3;
int curr_x = 0;
int width = 11;

void solve1() {
  final lines = File('input_files\\i3.txt').readAsLinesSync();
  lines.removeAt(0);
  width = lines.first.length;
  var no_trees = lines.fold(0, countTrees);
  print(no_trees);
}

int countTrees(int no_trees, String line) {
  var next_x = (curr_x + slope) % width;
  curr_x = next_x;
  if (line[next_x] == '#') {
    return no_trees + 1;
  } else {
    return no_trees;
  }
}

/*===== PART 2 =========================================================================*/

void solve2() {
  final lines = File('input_files\\i3.txt').readAsLinesSync();
  var itineraries = <Itinerary>[
    Itinerary(1),
    Itinerary(3),
    Itinerary(5),
    Itinerary(7),
  ];
  for (var k = 1; k < lines.length; k++) {
    var line = lines[k];
    itineraries.forEach((i) {
      i.next();
      if (line[i.curr_x] == '#') i.hit();
    });
  }

  var total = itineraries.fold(1, (no_trees, i) => no_trees * i.trees_hit);

  var double_y = Itinerary(1);
  for (var k = 2; k < lines.length; k += 2) {
    var line = lines[k];
    double_y.next();
    if (line[double_y.curr_x] == '#') double_y.hit();
  }

  print(total * double_y.trees_hit);
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
