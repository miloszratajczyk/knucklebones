import 'game.dart';

class MultiplayerGame extends Game {
  MultiplayerGame({required super.setState}) {
    randomizeTurn();
  }
}
