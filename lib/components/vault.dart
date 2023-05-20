import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../style/constants.dart';

class Vault extends StatefulWidget {
  const Vault({
    required this.diceNumber,
    super.key,
  });
  final int diceNumber;

  @override
  State<Vault> createState() => _VaultState();
}

class _VaultState extends State<Vault> with TickerProviderStateMixin {
  final List<Image> _frames = [];
  late final AnimationController _controller;
  final ValueNotifier<int> _spawnCount = ValueNotifier(0);

  int get _frameId => _controller.value < 0.6
      ? math.max(0, (_controller.value * 20).toInt() - 2)
      : 20 - (_controller.value * 20).toInt();

  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= 10; i++) {
      _frames.add(
        Image.asset(
          'assets/images/vault/vault$i.png',
          fit: BoxFit.fill,
          filterQuality: FilterQuality.none,
        ),
      );
    }
    _controller = AnimationController(
      duration: durationXL,
      vsync: this,
    );
    _spawnCount.addListener(() {
      _controller.reset();
      _controller.forward();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var frame in _frames) {
      precacheImage(frame.image, context);
    }
  }

  @override
  void didUpdateWidget(covariant Vault oldWidget) {
    super.didUpdateWidget(oldWidget);
    _spawnCount.value++;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, __) => _frames[_frameId],
          ),
        ),
        AnimatedSwitcher(
          duration: durationXL,
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
            key: ValueKey<int>(_spawnCount.value),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/dice/dice${widget.diceNumber}.png',
                ),
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
