import 'package:flutter/material.dart';
import 'package:knucklebones/components/board.dart';

import 'package:knucklebones/components/pixel_button.dart';
import 'package:knucklebones/components/vault.dart';
import 'package:knucklebones/style/constants.dart';

import '../../model/game.dart';

class MultiplayerScreen extends StatefulWidget {
  const MultiplayerScreen({Key? key}) : super(key: key);

  @override
  State<MultiplayerScreen> createState() => _MultiplayerScreenState();
}

class _MultiplayerScreenState extends State<MultiplayerScreen> {
  Game game = Game();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Knucklebones"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: AnimatedOpacity(
              duration: durationL,
              opacity: game.isPlayersTurn(2) ? 1.0 : 0.5,
              child: Center(
                child: Board(
                  alignToTop: false,
                  stacks: game.secondPlayer.stacks,
                  onPressed: (columnId) {
                    game.handleClick(2, columnId);
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
          Flexible(
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Player 1\nScore: ${game.firstPlayer.score}",
                      style: textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(child: Vault(diceNumber: game.diceNumber)),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Player 2\nScore: ${game.secondPlayer.score}",
                      style: textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: AnimatedOpacity(
              duration: durationL,
              opacity: game.isPlayersTurn(1) ? 1.0 : 0.5,
              child: Center(
                child: Board(
                  stacks: game.firstPlayer.stacks,
                  onPressed: (columnId) {
                    game.handleClick(1, columnId);
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
