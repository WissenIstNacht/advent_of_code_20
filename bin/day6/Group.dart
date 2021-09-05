class Group {
  String content = "";
  int size = 0;

  void add(String line) {
    content += line;
    size++;
  }
}

class EmptyGroup extends Group {}

class GroupMaker {
  int currLineIndx = 0;
  List<String> input;

  GroupMaker(this.input);

  Group next() {
    final group = new Group();
    for (currLineIndx; currLineIndx < input.length; currLineIndx++) {
      final currLine = input[currLineIndx];
      if (currLine.isEmpty) {
        currLineIndx++;
        return group;
      }

      group.add(currLine);
    }

    return EmptyGroup();
  }
}
