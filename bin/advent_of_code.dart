import 'dart:io';

import 'a9.dart';

void main(List<String> arguments) {
  solve2();
}

List<String> parseInput(int problem, bool test) {
  final c = test ? 't' : 'i';
  return File('input_files\\${c}${problem}.txt').readAsLinesSync();
}
