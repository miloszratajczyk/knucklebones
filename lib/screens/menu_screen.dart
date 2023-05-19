import 'package:flutter/material.dart';
import 'info_screen.dart';

import '../components/pixel_button.dart';
import '../style/constants.dart';

import 'game_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

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
            child: Padding(
              padding: paddingM,
              child: PixelButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const GameScreen(isMultiplayer: false),
                    ),
                  );
                },
                child: const Text(
                  "Singleplayer",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: paddingM,
              child: PixelButton(
                child: const Text(
                  "Multiplayer",
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const GameScreen(isMultiplayer: true),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: paddingM,
              child: PixelButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InfoScreen()),
                  );
                },
                child: const Text(
                  "Info",
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
