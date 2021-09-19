import 'package:test/test.dart';
import 'package:advent_of_code/solver.dart';
import 'dart:io';

import '../../bin/day10/a10p2.dart';

void main() {
  late Solver solver;
  setUp(() => {solver = Day10Part2()});

  test('Day 10 part 2 on input 1', () {
    final lines = File('test/day10/input1').readAsLinesSync();
    final res = solver.solve(lines);
    expect(res, equals('8'));
  });

  test('Day 10 part 2 on input 2', () {
    final lines = File('test/day10/input2').readAsLinesSync();
    final res = solver.solve(lines);
    expect(res, equals('19208'));
  });
}
