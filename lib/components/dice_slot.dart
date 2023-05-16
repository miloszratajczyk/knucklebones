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
  Image get _image {
    String diceName = switch (widget.occurrences) {
      3 => 'third_placed_dice',
      2 => 'second_placed_dice',
      _ => 'placed_dice'
    };

    return Image.asset(
      'assets/images/$diceName/$diceName${widget.number}.png',
      fit: BoxFit.fill,
      filterQuality: FilterQuality.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTertiaryLongPress: () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 75,
            height: 75,
            child: Image.asset(
              'assets/images/dice_slot.png',
              fit: BoxFit.fill,
              filterQuality: FilterQuality.none,
            ),
          ),
          SizedBox(
            width: 64,
            height: 64,
            child: AspectRatio(
              aspectRatio: 1,
              child: AnimatedOpacity(
                opacity: widget.number == 0 ? 0.0 : 1.0,
                duration: const Duration(seconds: 1),
                curve: Curves.ease,
                child: widget.number == 0 ? Container() : _image,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
