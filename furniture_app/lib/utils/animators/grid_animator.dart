import 'dart:async';

import 'package:flutter/material.dart';

class GridAnimator extends StatefulWidget {
  final Widget child;
  final Duration time;

  GridAnimator(this.child, this.time);

  @override
  _GridAnimatorState createState() => _GridAnimatorState();
}

class _GridAnimatorState extends State<GridAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Timer timer;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOutBack);
    timer = Timer(widget.time, controller.forward);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
            offset: Offset(0, (1 - animation.value) * 60), child: child);
      },
    );
  }
}

Timer timer;
Duration duration = Duration();
wait() {
  if (timer == null || !timer.isActive) {
    timer = Timer(Duration(microseconds: 120), () {
      duration = Duration();
    });
  }
  duration += Duration(milliseconds: 100);
  return duration;
}

class GridAnimatorWidget extends StatelessWidget {
  final Widget child;

  GridAnimatorWidget({this.child});

  @override
  Widget build(BuildContext context) {
    return GridAnimator(child, wait());
  }
}
