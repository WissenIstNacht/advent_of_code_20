class Grid {
  late int n, m;
  late List<List<int>> matrix;
  late List<List<int>> newMatrix;
  bool stepChanged = false;

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
    newMatrix = List.generate(m, (i) => List.generate(n, (j) => 0));
  }

  // given a position, return the surrounding elements as list
  List<int> getNeighbours(x, y) {
    var list = <int>[];
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

  bool isOccupied(x, y) {
    return matrix[x][y] == 1;
  }

  bool isEmpty(x, y) {
    return matrix[x][y] == 2;
  }

  int occupiedSeats() {
    var count = 0;
    for (var i = 0; i < m; i++) {
      for (var j = 0; j < n; j++) {
        if (matrix[i][j] == 1) {
          count++;
        }
      }
    }
    return count;
  }

  // checks first rule
  bool hasOccupiedNeighbor(x, y) {
    return getNeighbours(x, y).contains(1);
  }

  // checks second rule
  bool hasTooManyNeighbors(x, y) {
    // print(matrix.toString());
    // print('x: $x, y: $y');
    final neighbours = getNeighbours(x, y);
    // print('neighbours $neighbours');

    int folder(sum, element) => element == 1 ? sum + 1 : sum;
    final occupiedNeighbors = neighbours.fold(0, folder);

    // print('occupied: $occupiedNeighbors');
    return occupiedNeighbors >= 4;
  }

  // computes a cell's new state according to the rule, if they apply
  // return the new value if the cell's state changed, otherwise returns 0
  int newCellState(x, y) {
    if (isEmpty(x, y) && !hasOccupiedNeighbor(x, y)) {
      return 1;
    }
    if (isOccupied(x, y) && hasTooManyNeighbors(x, y)) {
      return 2;
    }
    return 0;
  }

  bool step() {
    // apply new state to each cell
    stepChanged = false;
    for (var i = 0; i < m; i++) {
      for (var j = 0; j < n; j++) {
        final newState = newCellState(i, j);
        if (newState > 0) {
          newMatrix[i][j] = newState;
          stepChanged = true;
        } else {
          newMatrix[i][j] = matrix[i][j];
        }
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
}
