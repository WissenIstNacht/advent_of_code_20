import 'dart:io';

/*===== PART 1 =========================================================================*/

void solve1() {
  final lines = File('inputs\\i1.txt').readAsLinesSync();
  final expenses = lines.map((e) => int.parse(e)).toList();

  for (var i = 0; i < expenses.length; i++) {
    for (var j = i; j < expenses.length; j++) {
      if (expenses[i] + expenses[j] == 2020) {
        print('Found expenses that up to 2020 at indeces $i and $j.');
        print('Their values are ${expenses[i]} and ${expenses[j]}');
        print('Their product is ${expenses[i] * expenses[j]}');
      }
    }
  }
}

void improved1() {
  final lines = File('inputs\\i1.txt').readAsLinesSync();
  final expenses = lines.map((e) => int.parse(e)).toList();
  expenses.sort();
  var lo = 0, hi = expenses.length - 1;

  var found = false;
  while (!found) {
    if (expenses[lo] + expenses[hi] == 2020) {
      found = true;
    } else if (expenses[lo] + expenses[hi] > 2020) {
      hi--;
    } else {
      lo++;
    }
  }
  var e1 = expenses[lo], e2 = expenses[hi];
  print('Found expenses that up to 2020 at indeces $lo and $hi.');
  print('Their values are $e1 and $e2');
  print('Their product is ${e1 * e2}');
}

/*===== PART 2 =========================================================================*/

void solve2() {
  var ops = 0;
  final lines = File('inputs\\i1.txt').readAsLinesSync();
  final expenses = lines.map((e) => int.parse(e)).toList();

  for (var i = 0; i < expenses.length; i++) {
    for (var j = i; j < expenses.length; j++) {
      for (var k = j + 1; k < expenses.length; k++) {
        ops += 1;
        if (expenses[i] + expenses[j] + expenses[k] == 2020) {
          print('Found expenses that up to 2020 at indeces $i, $j and $k.');
          print('Their values are ${expenses[i]}, ${expenses[j]} and ${expenses[k]}');
          print('Their product is ${expenses[i] * expenses[j] * expenses[k]}');
          print('It took $ops iterations to get here');
        }
      }
    }
  }
}
