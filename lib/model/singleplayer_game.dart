import 'package:knucklebones/core/utils.dart';
import 'package:knucklebones/style/constants.dart';

import 'game.dart';

class SingleplayerGame extends Game {
  SingleplayerGame({required super.setState});

  @override
  bool handleClick(int playerId, int columnId) {
    if (playerId == 2) return false;
    final toRebuild = super.handleClick(playerId, columnId);
    handleDice();
    return toRebuild;
  }

  void handleDice() async {
    final player = firstPlayer;
    final enemy = secondPlayer;

    if (!player.isDone && isPlayersTurn(1)) return;
    await Future.delayed(durationL * 2);

    var moveQuality = [
      for (int i = 0; i < 3; i++)
        enemy.canMove(i).toInt() *
            (player.stacks[i].count(diceNumber) +
                enemy.stacks[i].count(diceNumber)),
    ];

    const options = [
      [0, 1, 2],
      [2, 0, 1],
      [1, 2, 0],
      [0, 2, 1],
      [1, 0, 2],
      [2, 1, 0],
    ];
    for (var i in options.random()) {
      if (enemy.canMove(i) && moveQuality.max == moveQuality[i]) {
        enemy.move(i, diceNumber);
        player.remove(i, diceNumber);
        spawnDice();
        break;
      }
    }
    if (!player.isDone) {
      nextTurn();
    } else {
      if (enemy.isDone)
        end();
      else
        handleDice();
    }
    setState();
  }
}
