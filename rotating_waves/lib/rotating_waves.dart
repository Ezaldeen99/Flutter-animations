import 'package:flutter/material.dart';

class RotatingWaves extends StatefulWidget {
  RotatingWaves(
      {this.size = 200, this.color = Colors.green, this.centered = false});

  final double size;
  final bool centered;
  final Color color;

  @override
  _RotatingWavesState createState() => _RotatingWavesState();
}

class _RotatingWavesState extends State<RotatingWaves>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
              children: List.generate(
                  6,
                  (index) => Container(
                      width: widget.size,
                      height: widget.size,
                      padding: EdgeInsets.all(index * (widget.size / 10)),
                      child: AnimatedBuilder(
                          animation: _controller,
                          builder: (BuildContext context, Widget child) {
                            return Transform.rotate(
                              angle:
                                  _controller.value * (index + 1).ceil() * 6.3,
                              // angle: 0,
                              child: child,
                            );
                          },
                          child:
                              Shapes(index, widget.color, widget.centered))))),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Shapes extends StatefulWidget {
  Shapes(this.index, this.color, this.centered);

  final int index;
  final bool centered;
  final Color color;

  @override
  _ShapesState createState() => _ShapesState();
}

class _ShapesState extends State<Shapes> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DrawShapes(widget.index, widget.color, widget.centered),
    );
  }
}

class DrawShapes extends CustomPainter {
  DrawShapes(this.index, this.color, this.centered);

  final Color color;
  final bool centered;
  final int index;

  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = new Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    var startArc = (20 * index * 3.14) / 180;
    var endArc = ((90) * 3.14) / 180;

    //make the first as a circle
    if (index == 0 && centered) {
      brush.style = PaintingStyle.fill;
      canvas.drawCircle(Offset(size.height / 2, size.width / 2), 5, brush);
    } else {
      brush.style = PaintingStyle.stroke;
      canvas.drawArc(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height,
            width: size.width,
          ),
          startArc,
          endArc,
          false,
          brush);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
