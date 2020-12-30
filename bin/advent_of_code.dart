import 'dart:io';

import 'a8.dart';

void main(List<String> arguments) {
  solve1();
}

List<String> parseInput(int problem, bool test) {
  final c = test ? 't' : 'i';
  return File('input_files\\${c}${problem}.txt').readAsLinesSync();
}
