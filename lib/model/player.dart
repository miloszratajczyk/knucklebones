import 'package:knucklebones/core/utils.dart';

class Player {
  List<List<int>> stacks = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];

  int get score {
    return stacks.fold<int>(
      0,
      (previousValue, column) =>
          previousValue +
          column.fold<int>(
            0,
            (f, e) => f + (e * column.count(e)),
          ),
    );
  }

  bool get isDone {
    for (var i in stacks) for (var j in i) if (j == 0) return false;
    return true;
  }

  bool canMove(int columnId) => stacks[columnId].contains(0);
  void move(int columnId, int number) {
    stacks[columnId][stacks[columnId].indexOf(0)] = number;
  }

  void remove(int columnId, int number) {
    stacks[columnId].removeWhere((e) => e == number);
    while (stacks[columnId].length < 3) stacks[columnId].add(0);
  }
}
