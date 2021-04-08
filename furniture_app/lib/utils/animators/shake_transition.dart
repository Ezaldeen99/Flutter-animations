import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  ShakeTransition(
      {Key key,
      this.duration = const Duration(milliseconds: 900),
      this.offset = 140.0,
      @required this.child})
      : super(key: key);
  final Duration duration;
  final double offset;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: 0.0),
        duration: duration,
        curve: Curves.elasticOut,
        child: child,
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(value * offset, 0.0),
            child: child,
          );
        });
  }
}
