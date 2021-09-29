class Grid {
  late int n, m;
  late List<List<CellType>> matrix;
  late List<List<CellType>> newMatrix;
  bool stepChanged = false;

  Grid.fromList(List<String> list) {
    matrix = list.map((row) {
      final intRow = <CellType>[];
      for (var i = 0; i < row.length; i++) {
        if (row[i] == '.') {
          intRow.add(CellType.floor);
        } else if (row[i] == '#') {
          intRow.add(CellType.occupied);
        } else {
          intRow.add(CellType.empty);
        }
      }
      return intRow;
    }).toList();
    m = matrix.length;
    n = matrix[0].length;
    newMatrix =
        List.generate(m, (i) => List.generate(n, (j) => CellType.floor));
  }

  // given a position, return the surrounding elements as list
  List<CellType> getNeighbours(x, y) {
    var list = <CellType>[];
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
    return matrix[x][y] == CellType.occupied;
  }

  bool isEmpty(x, y) {
    return matrix[x][y] == CellType.empty;
  }

  int occupiedSeats() {
    var count = 0;
    for (var i = 0; i < m; i++) {
      for (var j = 0; j < n; j++) {
        if (matrix[i][j] == CellType.occupied) {
          count++;
        }
      }
    }
    return count;
  }

  // checks first rule
  bool hasOccupiedNeighbor(x, y) {
    return getNeighbours(x, y).contains(CellType.occupied);
  }

  // checks second rule
  bool hasTooManyNeighbors(x, y) {
    final neighbours = getNeighbours(x, y);

    int folder(int sum, CellType element) =>
        element == CellType.occupied ? sum + 1 : sum;
    final occupiedNeighbors = neighbours.fold(0, folder);

    return occupiedNeighbors >= 4;
  }

  // computes a cell's new state according to the rule, if they apply
  // return the new value if the cell's state changed, otherwise returns 0
  CellType newCellState(x, y) {
    if (isEmpty(x, y) && !hasOccupiedNeighbor(x, y)) {
      return CellType.occupied;
    }
    if (isOccupied(x, y) && hasTooManyNeighbors(x, y)) {
      return CellType.empty;
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
        row.add(matrix[i][j].index);
      }
      ints.add(row);
    }
    return ints;
  }
}

enum CellType { floor, occupied, empty }
