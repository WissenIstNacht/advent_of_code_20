class Grid {
  late int n, m;
  late List<List<int>> matrix;
  late List<List<int>> newMatrix;

  Grid.fromList(List<String> list) {
    matrix = list.map((row) {
      final intRow = <int>[];
      for (var i = 0; i < row.length; i++) {
        if (row[i] == '.') {
          intRow.add(0);
        } else if (row[i] == '#') {
          intRow.add(1);
        } else {
          intRow.add(2);
        }
      }
      return intRow;
    }).toList();
    m = matrix.length;
    n = matrix[0].length;
    newMatrix = matrix;
  }

  // given a position, return the surrounding elements
  List<int> getSurroundingElements(x, y) {
    var list = <int>[];
    for (var i = x - 1; i <= x + 1; i++) {
      for (var j = y - 1; j <= y + 1; j++) {
        if (i < 0 || j < 0 || i >= m || j >= n) {
          continue;
        }
        list.add(matrix[i][j]);
      }
    }
    return list;
  }

  bool isOccupied(x, y) {
    return matrix[x][y] == 1;
  }

  bool isEmpty(x, y) {
    return matrix[x][y] == 2;
  }

  bool hasOccupiedNeighbor(x, y) {
    return getSurroundingElements(x, y).contains(1);
  }

  bool hasTooManyNeighbors(x, y) {
    int folder(sum, element) => element == 1 ? sum + 1 : sum;
    final occupiedNeighbors = getSurroundingElements(x, y).fold(0, folder);
    return occupiedNeighbors >= 4;
  }

  // int newCellState(x, y) {
  //   // if cell is empty and does not contain occupied neighbor
  //   if (isEmpty(x, y) && !hasOccupiedNeighbor(x, y)) {
  //     return 1;
  //   }
  //   // if cell is occupied  four or more seats are occupied
  //   if (isOccupied(x, y) && ) {
  //     return 2;
  //   }
  //   //return current state
  //   return matrix[x][y];
  // }
}
