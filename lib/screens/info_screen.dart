import 'package:flutter/material.dart';

import '../components/pixel_button.dart';
import '../style/constants.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                "Knuckle\nBones",
                style: textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: paddingL,
              child: Text(
                "The vault shoots up a dice with a random number. Players take turns placing the dices in one of their three stacks. If a dice with the same number is in the stack of your enemy, the enemy's dice gets removed, but if it's in your stack its value is multiplied by the number of occurrences in the stack. Game ends when no player can make a move and the winner is the person with the highest score.",
                style: textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: paddingM,
              child: PixelButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "GO BACK",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
