import 'package:test/test.dart';
import 'dart:io';

import '../../bin/day11/grid.dart';

void main() {
  test('Testing Grid constructor for dots', () {
    final lines = File('test/day11/dotsInput').readAsLinesSync();
    final res = Grid.fromList(lines);
    expect(
        res.matrix,
        equals([
          [0, 0, 0],
          [0, 0, 0],
          [0, 0, 0]
        ]));
  });

  test('Testing Grid constructor hashtags', () {
    final lines = File('test/day11/hashtagsInput').readAsLinesSync();
    final res = Grid.fromList(lines);
    expect(
        res.matrix,
        equals([
          [1, 1, 1],
          [1, 1, 1],
          [1, 1, 1]
        ]));
  });

  test('Testing Grid constructor L', () {
    final lines = File('test/day11/lsInput').readAsLinesSync();
    final res = Grid.fromList(lines);
    expect(
        res.matrix,
        equals([
          [2, 2, 2],
          [2, 2, 2],
          [2, 2, 2]
        ]));
  });

  test('Testing Grid constructor basic input', () {
    final lines = File('test/day11/basicInput').readAsLinesSync();
    final res = Grid.fromList(lines);
    expect(
        res.matrix,
        equals([
          [0, 2, 1],
          [1, 0, 2],
          [2, 1, 0]
        ]));
  });
}
