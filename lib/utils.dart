import 'dart:io';

class Utils {
  static List<String> readInput(int problem) {
    return File('bin/day${problem}/input.txt').readAsLinesSync();
  }

  static void prettyPrint(String result) {
    print("The result is: ${result}");
  }
}
