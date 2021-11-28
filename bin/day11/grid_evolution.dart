import 'grid.dart';

class GridEvolver {
  late Grid currGrid;
  late Grid nextGrid;
  int stepCount = 0;

  GridEvolver(Grid grid) {
    currGrid = grid;
    nextGrid = grid.copy();
  }

  bool step() {
    var stepChanged = false;
    for (var i = 0; i < currGrid.m; i++) {
      for (var j = 0; j < currGrid.n; j++) {
        final currCell = currGrid.getCell(i, j);
        final newCell = currGrid.newCellState(i, j);
        if (currCell.state != newCell.state) {
          stepChanged = true;
        }
        nextGrid.setCell(i, j, newCell);
      }
    }
    // swap the matrices
    currGrid = nextGrid.copy();
    stepCount++;
    return stepChanged;
  }
}
