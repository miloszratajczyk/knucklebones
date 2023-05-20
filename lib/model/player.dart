import '../core/utils.dart';

class Player {
  /// Stacks containing dice numbers
  List<List<int>> stacks = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];

  /// Calculates the complete score
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

  /// Checks if player has no more possible moves
  bool get isDone {
    for (var stack in stacks) {
      for (var number in stack) {
        if (number == 0) {
          return false;
        }
      }
    }
    return true;
  }

  /// Checks it there's a place for another dice
  bool canMove(int columnId) => stacks[columnId].contains(0);

  /// Places a dice in an empty spot if there is one
  void move(int columnId, int number) {
    stacks[columnId][stacks[columnId].indexOf(0)] = number;
  }

  /// Removes all dices with given number
  void remove(int columnId, int number) {
    stacks[columnId].removeWhere((e) => e == number);
    while (stacks[columnId].length < 3) {
      stacks[columnId].add(0);
    }
  }
}
