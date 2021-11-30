import 'cell.dart';
import 'grid.dart';
import 'updater.dart';

abstract class GridEvolver with Updater {
  late Grid currGrid;
  late Grid nextGrid;
  int stepCount = 0;

  GridEvolver(Grid grid) {
    currGrid = grid;
    nextGrid = grid.copy();
  }

  Grid getGrid() => currGrid;

  bool step() {
    var stepChanged = false;
    for (var i = 0; i < currGrid.m; i++) {
      for (var j = 0; j < currGrid.n; j++) {
        final currCell = currGrid.getCell(i, j);
        final newCell = newCellState(i, j);
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

class Evolver1 extends GridEvolver {
  Evolver1(Grid grid) : super(grid);

  @override
  Cell newCellState(int x, int y) {
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
}

class Evolver2 extends GridEvolver {
  Evolver2(Grid grid) : super(grid);

  @override
  Cell newCellState(int x, int y) {
    var currCell = currGrid.getCell(x, y);
    var neighbourhood = currGrid.getFirstNeighboursInSight(x, y);
    if (currCell.isEmpty() && !neighbourhood.hasOccupiedNeighbor(x, y)) {
      return Cell.occupied();
    }
    if (currCell.isOccupied() && neighbourhood.hasTooManyNeighbors(x, y, 5)) {
      return Cell.empty();
    }

    return currCell.copy();
  }
}
