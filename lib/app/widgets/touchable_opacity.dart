import 'package:flutter/cupertino.dart';

class TouchableOpacity extends StatelessWidget {
  const TouchableOpacity({
    super.key,
    required this.child,
    this.onPressed,
    this.padding = EdgeInsets.zero,
    this.alignment = Alignment.center,
    this.pressedOpacity = 0.4,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsets padding;
  final Alignment alignment;
  final double? pressedOpacity;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      alignment: alignment,
      padding: padding,
      pressedOpacity: pressedOpacity,
      minimumSize: Size(0, 0),
      child: child,
    );
  }
}
