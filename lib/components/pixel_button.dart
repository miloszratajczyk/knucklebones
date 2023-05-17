import 'package:flutter/material.dart';

class PixelButton extends StatefulWidget {
  const PixelButton({
    required this.child,
    required this.onPressed,
    super.key,
  });

  final Widget child;
  final Function() onPressed;

  @override
  State<PixelButton> createState() => _PixelButtonState();
}

class _PixelButtonState extends State<PixelButton> {
  final _buttonPadding =
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

  bool _isPressed = false;
  get _image => _isPressed
      ? 'assets/images/pixel_button_pressed.png'
      : 'assets/images/pixel_button.png';

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.labelLarge ?? const TextStyle(),
      child: AspectRatio(
        aspectRatio: 4,
        child: GestureDetector(
          onTapDown: (_) => setState(() {
            _isPressed = true;
          }),
          onTapUp: (_) => setState(() {
            _isPressed = false;
          }),
          onTap: widget.onPressed,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_image),
                fit: BoxFit.contain,
                filterQuality: FilterQuality.none,
              ),
            ),
            padding: _buttonPadding,
            alignment: Alignment.center,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
