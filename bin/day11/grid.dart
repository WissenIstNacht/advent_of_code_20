import 'package:characters/characters.dart';

import 'cell.dart';

class Grid {
  late int n, m;
  late List<List<Cell>> matrix;
  late List<List<Cell>> newMatrix;
  bool stepChanged = false;

  Grid.fromList(List<String> list) {
    matrix = list.map((row) {
      final chars = Characters(row);
      return chars.map((s) => Cell.fromString(s)).toList();
    }).toList();
    m = matrix.length;
    n = matrix[0].length;

    // generate "copy" matrix filled with floor cells
    newMatrix = List.generate(m, (i) => List.generate(n, (j) => Cell.floor()));
  }

  // Given an x,y position on the grid, return the surrounding elements as list
  List<Cell> getNeighbours(x, y) {
    var list = <Cell>[];
    for (var i = x - 1; i <= x + 1; i++) {
      for (var j = y - 1; j <= y + 1; j++) {
        if (i < 0 || j < 0 || i >= m || j >= n || i == x && j == y) {
          continue;
        }
        list.add(matrix[i][j]);
      }
    }
    return list;
  }

  int occupiedSeatsCount() {
    var count = 0;
    for (var i = 0; i < m; i++) {
      for (var j = 0; j < n; j++) {
        if (matrix[i][j].isOccupied()) count++;
      }
    }
    return count;
  }

  // checks first rule
  bool hasOccupiedNeighbor(x, y) =>
      getNeighbours(x, y).any((cell) => cell.isOccupied());

  // checks second rule
  bool hasTooManyNeighbors(x, y) {
    final neighbours = getNeighbours(x, y);

    int folder(int sum, Cell element) => element.isOccupied() ? sum + 1 : sum;
    final occupiedNeighbors = neighbours.fold(0, folder);

    return occupiedNeighbors >= 4;
  }

  // computes a cell's new state according to the rule.
  //
  // If they apply return the new value if the cell's state changed, otherwise
  // returns 0
  Cell newCellState(x, y) {
    if (matrix[x][y].isEmpty() && !hasOccupiedNeighbor(x, y)) {
      return Cell.occupied();
    }
    if (matrix[x][y].isOccupied() && hasTooManyNeighbors(x, y)) {
      return Cell.empty();
    }

    return matrix[x][y];
  }

  bool step() {
    // apply new state to each cell
    stepChanged = false;
    for (var i = 0; i < m; i++) {
      for (var j = 0; j < n; j++) {
        final currState = matrix[i][j];
        final newState = newCellState(i, j);
        if (currState != newState) {
          stepChanged = true;
        }
        newMatrix[i][j] = newState;
      }
    }
    // swap the matrices
    copy();
    return stepChanged;
  }

  void copy() {
    //copy new matrix into matrix
    for (var i = 0; i < m; i++) {
      for (var j = 0; j < n; j++) {
        matrix[i][j] = newMatrix[i][j];
      }
    }
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
