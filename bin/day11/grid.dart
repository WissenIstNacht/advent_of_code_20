import 'package:characters/characters.dart';

import 'cell.dart';
import 'neighbourhood.dart';

class Grid {
  late int n, m;
  late List<List<Cell>> matrix;

  // CONSTRUCTORS ==============================================================

  Grid.fromList(List<String> list) {
    matrix = list.map((row) {
      final chars = Characters(row);
      return chars.map((s) => Cell.fromString(s)).toList();
    }).toList();
    m = matrix.length;
    n = matrix[0].length;
  }

  Grid(List<List<Cell>> cells) {
    matrix = cells;
    m = matrix.length;
    n = matrix[0].length;
  }

  // GETTER & SETTER ===========================================================

  Cell getCell(int i, int j) => matrix[i][j];

  void setCell(int i, int j, Cell cell) => matrix[i][j] = cell;

  // Given an int x,y position on the grid, return the surrounding elements as list
  Neighbourhood getNeighbours(int x, int y) {
    var neighbourhood = Neighbourhood.empty();
    for (var i = x - 1; i <= x + 1; i++) {
      for (var j = y - 1; j <= y + 1; j++) {
        if (i < 0 || j < 0 || i >= m || j >= n || i == x && j == y) {
          continue;
        }
        neighbourhood.add(matrix[i][j]);
      }
    }
    return neighbourhood;
  }

  // getFirstNeighboursInSight() {
  //   //TODO check if this is right
  //   var neighbourhood = Neighbourhood.empty();
  //   for (var i = 0; i < m; i++) {
  //     for (var j = 0; j < n; j++) {
  //       if (matrix[i][j].isAlive) {
  //         neighbourhood.add(matrix[i][j]);
  //       }
  //     }
  //   }
  //   return neighbourhood;
  // }

  // QUERIES ===================================================================

  int occupiedSeatsCount() {
    var count = 0;
    for (var i = 0; i < m; i++) {
      for (var j = 0; j < n; j++) {
        if (matrix[i][j].isOccupied()) count++;
      }
    }
    return count;
  }

  // UTILS =====================================================================

  Grid copy() {
    final newMatrix =
        matrix.map((row) => row.map((cell) => cell.copy()).toList()).toList();
    return Grid(newMatrix);
  }

  List<List<int>> toInts() {
    final ints = <List<int>>[];
    for (var i = 0; i < m; i++) {
      final row = <int>[];
      for (var j = 0; j < n; j++) {
        row.add(matrix[i][j].toInt());
      }
      ints.add(row);
    }
    return ints;
  }
}
