import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'dart:ui' as ui;

class ConstellationPainter extends StatefulWidget {
  final List<Offset> constellations;
  final Color color;

  ConstellationPainter(this.constellations, this.color);

  @override
  _ConstellationPainterState createState() => _ConstellationPainterState();
}

class _ConstellationPainterState extends State<ConstellationPainter> {
  Random random = Random();
  late List<bool> twinklingStars;

  @override
  void initState() {
    super.initState();
    twinklingStars = List.generate(widget.constellations.length, (index) => random.nextBool());
    _startTwinklingAnimation();
  }

  void _startTwinklingAnimation() {
    Timer.periodic(Duration(milliseconds: 0), (Timer timer) {
      if (!timer.isActive) {
        timer.cancel();
      } else {
        _updateTwinklingStars();
      }
    });
  }

  void _updateTwinklingStars() {
    setState(() {
      twinklingStars = List.generate(widget.constellations.length, (index) => random.nextBool());
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ConstellationPainter(widget.constellations, widget.color, twinklingStars),
    );
  }
}

class _ConstellationPainter extends CustomPainter {
  final List<Offset> constellations;
  final Color color;
  final List<bool> twinklingStars;
  Random random = Random();

  _ConstellationPainter(this.constellations, this.color, this.twinklingStars);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.5;

    for (int i = 0; i < constellations.length; i++) {
      if (twinklingStars[i]) {
        _drawTwinklingStar(canvas, constellations[i], paint);
      }
    }
  }

  void _drawTwinklingStar(Canvas canvas, Offset position, Paint paint) {
    double randomBrightness = 0.5 + random.nextDouble() * 0.5; // 밝기를 랜덤으로 조절
    paint.color = color.withOpacity(randomBrightness); // 랜덤 밝기로 설정

    double randomRadius = 3.0 + random.nextDouble() * 2.0;
    canvas.drawCircle(
      position,
      randomRadius,
      paint
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          convertRadiusToSigma(randomRadius),
        ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double convertRadiusToSigma(double radius) {
    return radius;
  }
}
