import 'package:flutter/material.dart';

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
  final List<Image> frames = [];
  double _animationProgress = 0.0;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  void spawnDice() {
    setState(() {
      _animationProgress = 1.0;
    });
    _controller.forward();
  }

  int get frameId {
    if (_controller.value < 0.6) {
      return (_controller.value * 20).toInt() - 2;
    } else {
      return 20 - (_controller.value * 20).toInt();
    }
  }

  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= 10; i++) {
      frames.add(
        Image.asset(
          'assets/images/vault/vault$i.png',
          fit: BoxFit.fill,
          filterQuality: FilterQuality.none,
        ),
      );
    }
    spawnDice();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var frame in frames) {
      precacheImage(frame.image, context);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              if ((_controller.value * 10).toInt() > 0) {
                return AspectRatio(
                  aspectRatio: 1,
                  child: frames[frameId],
                );
              } else {
                return AspectRatio(
                  aspectRatio: 1,
                  child: frames[0],
                );
              }
            },
          ),
          AnimatedRotation(
            turns: _animationProgress,
            duration: const Duration(seconds: 1),
            curve: Curves.decelerate,
            child: AnimatedScale(
              scale: _animationProgress * 0.5,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOutBack,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image(
                  image: AssetImage(
                      'assets/images/dice/dice${widget.diceNumber}.png'),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
