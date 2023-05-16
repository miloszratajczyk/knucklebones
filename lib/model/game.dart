import 'dart:math';

import 'package:knucklebones/model/player.dart';

class Game {
  Player firstPlayer = Player();
  Player secondPlayer = Player();

  bool turn = false;
  int diceNumber = 1;

  final _rnd = Random();

  bool isPlayersTurn(int id) => (id == 1 && turn) || (id == 2 && !turn);
  void spawnDice() => diceNumber = _rnd.nextInt(6) + 1;
  void nextTurn() => turn = !turn;
  void start() => spawnDice();

  void handleClick(int playerId, int columnId) {
    final player = playerId == 1 ? firstPlayer : secondPlayer;
    final enemy = playerId == 2 ? firstPlayer : secondPlayer;
    if (!isPlayersTurn(playerId)) return;
    if (!player.canMove(columnId)) return;
    player.move(columnId, diceNumber);
    enemy.remove(columnId, diceNumber);
    spawnDice();
    if (!enemy.isDone) nextTurn();
  }
}
