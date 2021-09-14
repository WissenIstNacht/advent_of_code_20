import 'package:avent_of_code/solver.dart';
import 'seatNumber.dart';

class Day5Part2 extends Solver {
  Day5Part2() : super(5);

  @override
  String solve(List<String> input) {
    var seat_ids = input.map(toSeatNumber).toList()..sort();

    var res = 0;
    for (var i = 0; i < seat_ids.length - 1; i++) {
      if (seat_ids[i + 1] - seat_ids[i] > 1) {
        res = seat_ids[i] + 1;
        break;
      }
      ;
    }

    return res.toString();
  }
}
