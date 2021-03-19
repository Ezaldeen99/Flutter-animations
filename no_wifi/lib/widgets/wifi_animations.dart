import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WifiAnimations extends StatefulWidget {
  WifiAnimations(
      {this.size = 200, this.color = Colors.grey, this.centered = true});

  final double size;
  final bool centered;
  final Color color;

  @override
  _WifiAnimationsState createState() => _WifiAnimationsState();
}

class _WifiAnimationsState extends State<WifiAnimations>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
              children: List.generate(6, (index) {
            if (index == 5) {
              return Positioned(
                top: Get.height / 2 + 30,
                right: 40,
                left: 40,
                child: Container(
                  width: 250.0,
                  height: 300,
                  child: TypewriterAnimatedTextKit(
                    speed: const Duration(milliseconds: 50),
                    onTap: () {},
                    text: [
                      "No Internet Connection",
                      "Please Check your Internet Settings",
                      "Thanks for watching ^^",
                    ],
                    textStyle: TextStyle(
                        fontSize: 20.0,
                        fontFamily: "Agne",
                        color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            } else {
              return Center(
                child: Container(
                    width: widget.size,
                    height: widget.size,
                    padding: EdgeInsets.all(index * (widget.size / 10)),
                    child: _ShapesState(
                      controller: _controller,
                      color: widget.color,
                      centered: widget.centered,
                      index: index,
                    )),
              );
            }
          })),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _ShapesState extends AnimatedWidget {
  _ShapesState(
      {this.index,
      this.color,
      this.centered,
      @required AnimationController controller})
      : super(listenable: controller);

  final int index;
  final bool centered;
  final Color color;

  Animation<double> get controller => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DrawShapes(index, color, centered, controller.value),
    );
  }
}

class DrawShapes extends CustomPainter {
  DrawShapes(this.index, this.color, this.centered, this.controller);

  ///[color] the wifi disabled color
  final Color color;

  ///[centered] draw wifi centered dot ?
  final bool centered;
  final int index;
  final double controller;

  @override
  void paint(Canvas canvas, Size size) {
    Color _color = Colors.grey;
    if ((4 - index) == ((controller * 5).toInt())) {
      _color = Colors.black;
    }

    Paint brush = new Paint()
      ..color = _color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    var startArc = (225 * 3.14) / 180;
    var endArc = (90 * 3.14) / 180;

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
    return true;
  }
}
