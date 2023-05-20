import 'package:flutter/material.dart';

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
  AssetImage get _image {
    if (widget.number == 0) {
      return const AssetImage(
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
