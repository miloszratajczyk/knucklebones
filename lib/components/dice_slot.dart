import 'package:flutter/material.dart';
import 'package:knucklebones/style/constants.dart';

class DiceSlot extends StatefulWidget {
  const DiceSlot({
    required this.number,
    this.occurrences = 1,
    super.key,
  });

  final int number;
  final int occurrences;

  @override
  State<DiceSlot> createState() => _DiceSlotState();
}

class _DiceSlotState extends State<DiceSlot> {
  /// Returns the image for given number and occurrences
  AssetImage get _image {
    if (widget.number == 0) {
      return AssetImage(
        'assets/images/no_dice.png',
      );
    }
    String diceName = switch (widget.occurrences) {
      3 => 'third_placed_dice',
      2 => 'second_placed_dice',
      _ => 'placed_dice'
    };
    return AssetImage(
      'assets/images/$diceName/$diceName${widget.number}.png',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // SizedBox(
        //   width: 75,
        //   height: 75,
        //   child: Image.asset(
        //     'assets/images/dice_slot.png',
        //     fit: BoxFit.fill,
        //     filterQuality: FilterQuality.none,
        //   ),
        // ),
        Container(
          width: 75,
          height: 75,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/dice_slot.png'),
              fit: BoxFit.fill,
              filterQuality: FilterQuality.none,
            ),
          ),
        ),
        // SizedBox(
        //   width: 64,
        //   height: 64,
        //   child: AnimatedOpacity(
        //     opacity: widget.number == 0 ? 0.0 : 1.0,
        //     duration: const Duration(seconds: 1),
        //     curve: Curves.ease,
        //     child: widget.number == 0 ? Container() : _image,
        //   ),
        // ),

        // if (widget.number != 0)
        //   AnimatedContainer(
        //     width: 64,
        //     height: 64,
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         image: _image,
        //         fit: BoxFit.fill,
        //         filterQuality: FilterQuality.none,
        //       ),
        //     ),
        //     duration: const Duration(seconds: 1),
        //     curve: Curves.ease,
        //   ),
        AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: RotationTransition(
                turns: animation,
                child: child,
              ),
            );
          },
          // child: Text(
          //   '${widget.number}',
          //   key: ValueKey<int>(widget.number),
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ),
          child: Container(
            key: ValueKey<String>("${widget.number}${widget.occurrences}"),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: _image,
                fit: BoxFit.fill,
                filterQuality: FilterQuality.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
