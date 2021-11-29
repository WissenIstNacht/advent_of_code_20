import 'cell.dart';

class Neighbourhood extends Iterable<Cell> {
  late List<Cell> cells;

  Neighbourhood(this.cells);

  Neighbourhood.empty() {
    cells = <Cell>[];
  }

  void add(Cell cell) => cells.add(cell);

  // checks first rule
  bool hasOccupiedNeighbor(int x, int y) =>
      cells.any((cell) => cell.isOccupied());

  // checks second rule
  bool hasTooManyNeighbors(int x, int y, int n) {
    int folder(int sum, Cell element) => element.isOccupied() ? sum + 1 : sum;
    final occupiedNeighbors = cells.fold(0, folder);

    return occupiedNeighbors >= n;
  }

  @override
  Iterator<Cell> get iterator => cells.iterator;
}
