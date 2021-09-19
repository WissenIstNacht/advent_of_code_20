class Grid {
  late List<List<int>> grid;

  Grid.fromList(List<String> list) {
    grid = list.map((row) {
      final intRow = <int>[];
      for (var i = 0; i < row.length; i++) {
        if (intRow[i] == '.') {
          intRow.add(0);
        } else if (row[i] == '#') {
          intRow.add(2);
        } else {
          intRow.add(1);
        }
      }
      return intRow;
    }).toList();
  }
}
