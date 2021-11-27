class Cell {
  late CellType state;

  Cell.fromString(String s) {
    if (s == '.') {
      state = CellType.floor;
    } else if (s == '#') {
      state = CellType.occupied;
    } else if (s == 'L') {
      state = CellType.empty;
    } else {
      throw Exception('Invalid cell type: $s');
    }
  }

  Cell.floor() {
    state = CellType.floor;
  }

  Cell.occupied() {
    state = CellType.occupied;
  }

  Cell.empty() {
    state = CellType.empty;
  }

  bool isOccupied() => state == CellType.occupied;

  bool isEmpty() => state == CellType.empty;

  bool isFloor() => state == CellType.floor;

  void occupy() {
    state = CellType.occupied;
  }

  void empty() {
    state = CellType.empty;
  }

  int toInt() => state.index;
}

enum CellType { floor, occupied, empty }
