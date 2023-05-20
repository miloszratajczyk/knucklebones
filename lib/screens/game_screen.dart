import 'package:flutter/material.dart';
import '../core/utils.dart';
import '../model/multiplayer_game.dart';
import '../model/singleplayer_game.dart';
import '../components/board.dart';

import '../components/pixel_button.dart';
import '../components/vault.dart';
import '../style/constants.dart';

import '../../model/game.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    required this.isMultiplayer,
    super.key,
  });

  final bool isMultiplayer;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late Game _game;

  @override
  void initState() {
    super.initState();
    _setupGame();
  }

  void _setupGame() {
    _game = widget.isMultiplayer
        ? MultiplayerGame(setState: () => setState(() {}))
        : SingleplayerGame(setState: () => setState(() {}));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Knucklebones"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: AnimatedOpacity(
              duration: durationL,
              opacity:
                  (_game.isPlayersTurn(1) || _game.winner != 0) ? 0.5 : 1.0,
              child: Center(
                child: Board(
                  alignToTop: false,
                  stacks: _game.secondPlayer.stacks,
                  onPressed: (columnId) {
                    _game.handleClick(2, columnId) >> () => setState(() {});
                  },
                ),
              ),
            ),
          ),
          if (_game.winner == 0) _buildVaultPanel(),
          if (_game.winner != 0) _buildGameOverPanel(),
          Expanded(
            flex: 2,
            child: AnimatedOpacity(
              duration: durationL,
              opacity:
                  (_game.isPlayersTurn(2) || _game.winner != 0) ? 0.5 : 1.0,
              child: Center(
                child: Board(
                  stacks: _game.firstPlayer.stacks,
                  onPressed: (columnId) {
                    _game.handleClick(1, columnId) >> () => setState(() {});
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Flexible _buildVaultPanel() {
    final textTheme = Theme.of(context).textTheme;
    return Flexible(
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Player 1\nScore: ${_game.firstPlayer.score}",
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Vault(
                diceNumber: _game.diceNumber,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Player 2\nScore: ${_game.secondPlayer.score}",
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildGameOverPanel() {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        children: [
          Flexible(
            child: Center(
              child: Text(
                _game.winnerText,
                style: textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Player 1:\t${_game.firstPlayer.score} - VS - Player 2:\t${_game.secondPlayer.score}",
                style: textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Flexible(
            child: PixelButton(
              onPressed: _setupGame,
              child: const Text(
                "Play again",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
