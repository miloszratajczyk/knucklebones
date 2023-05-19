import 'package:flutter/material.dart';
import 'dice_slot.dart';
import '../core/utils.dart';

class Board extends StatefulWidget {
  const Board({
    required this.stacks,
    required this.onPressed,
    this.alignToTop = true,
    super.key,
  });

  final List<List<int>> stacks;
  final void Function(int coulmId) onPressed;
  final bool alignToTop;

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < 3; i++)
          GestureDetector(
            onTap: () => widget.onPressed(i),
            child: Column(
              verticalDirection: widget.alignToTop
                  ? VerticalDirection.down
                  : VerticalDirection.up,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int j = 0; j < 3; j++)
                  DiceSlot(
                    number: widget.stacks[i][j],
                    occurrences: widget.stacks[i].count(widget.stacks[i][j]),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
