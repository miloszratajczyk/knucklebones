import 'dart:math';

import 'package:knucklebones/core/utils.dart';

import 'player.dart';

abstract class Game {
  Game({required this.setState});

  final Function() setState;

  Player firstPlayer = Player();
  Player secondPlayer = Player();

  /// Number describing who won
  /// 0 - no winner
  /// 1 - player 1 won
  /// 2 - player 2 won
  /// 3 - tie
  int winner = 0;

  // Bool deciding who takes the turn
  // true - first player's turn
  // false - second player's turn
  bool _turn = true;

  /// The number on currently spawned dice
  int diceNumber = 1;

  final _rng = Random();

  bool isPlayersTurn(int id) => (id == 1 && _turn) || (id == 2 && !_turn);
  void spawnDice() {
    print(diceNumber);
    var randomNumber = _rng.nextInt(6) + 1;
    if (randomNumber == diceNumber) {
      spawnDice();
    } else {
      diceNumber = randomNumber;
    }
  }

  void nextTurn() => _turn = !_turn;
  void randomizeTurn() => _turn = _rng.nextBool();
  void start() => spawnDice();
  void end() {
    final score1 = firstPlayer.score;
    final score2 = secondPlayer.score;
    if (score1 > score2) {
      winner = 1;
    } else if (score1 < score2) {
      winner = 2;
    } else {
      winner = 3;
    }
  }

  String get winnerText => switch (winner) {
        1 => "Player 1 won",
        2 => "Player 2 won",
        _ => "Nobody won"
      };

  /// Handles click on the board and returns whether needs rebuild
  bool handleClick(int playerId, int columnId) {
    final player = playerId == 1 ? firstPlayer : secondPlayer;
    final enemy = playerId == 2 ? firstPlayer : secondPlayer;
    if (!isPlayersTurn(playerId)) return false;
    if (!player.canMove(columnId)) return false;
    player.move(columnId, diceNumber);
    enemy.remove(columnId, diceNumber);
    spawnDice();
    if (!enemy.isDone) {
      nextTurn();
    } else if (player.isDone) {
      end();
    }
    return true;
  }
}
