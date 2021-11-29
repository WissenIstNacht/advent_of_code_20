import 'cell.dart';
import 'grid.dart';

class GridEvolver {
  late Grid currGrid;
  late Grid nextGrid;
  int stepCount = 0;

  GridEvolver(Grid grid) {
    currGrid = grid;
    nextGrid = grid.copy();
  }

  // computes a cell's new state according to the rule.
  //
  // If they apply return the new value if the cell's state changed, otherwise
  // returns 0
  Cell _newCellState(int x, int y) {
    var currCell = currGrid.getCell(x, y);
    var neighbourhood = currGrid.getNeighbours(x, y);
    if (currCell.isEmpty() && !neighbourhood.hasOccupiedNeighbor(x, y)) {
      return Cell.occupied();
    }
    if (currCell.isOccupied() && neighbourhood.hasTooManyNeighbors(x, y, 4)) {
      return Cell.empty();
    }

    return currCell.copy();
  }

  bool step() {
    var stepChanged = false;
    for (var i = 0; i < currGrid.m; i++) {
      for (var j = 0; j < currGrid.n; j++) {
        final currCell = currGrid.getCell(i, j);
        final newCell = _newCellState(i, j);
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
