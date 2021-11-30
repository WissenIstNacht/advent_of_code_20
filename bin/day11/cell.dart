class Cell {
  late CellType state;

  // CONSTRUCTORS ==============================================================

  Cell(this.state);

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

  // QUERIES ===================================================================

  bool isOccupied() => state == CellType.occupied;

  bool isEmpty() => state == CellType.empty;

  bool isFloor() => state == CellType.floor;

  bool isSeat() => state != CellType.floor;

  // GETTERS ===================================================================

  void occupy() {
    state = CellType.occupied;
  }

  void empty() {
    state = CellType.empty;
  }

  // UTILS =====================================================================

  Cell copy() => Cell(state);

  int toInt() => state.index;
}

enum CellType { floor, occupied, empty }
