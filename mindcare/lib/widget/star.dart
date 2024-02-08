import 'package:flutter/material.dart';
import 'dart:math';

class StarPainterWidget extends StatefulWidget {
  final List<Offset> starPositions;
  final Color color;

  StarPainterWidget(this.starPositions, this.color);

  @override
  _StarPainterWidgetState createState() => _StarPainterWidgetState();
}

class _StarPainterWidgetState extends State<StarPainterWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 100000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: StarPainter(
            widget.starPositions,
            widget.color,
            _controller.value,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class StarPainter extends CustomPainter {
  final List<Offset> starPositions;
  final Color color;
  final List<double> brightnesses; // 각 별의 밝기를 저장하기 위한 리스트
  final Random random;
  final double animationValue;

  StarPainter(
    this.starPositions,
    this.color,
    this.animationValue,
  )   : brightnesses = List.filled(starPositions.length, 0),
        random = Random() {
    _initializeBrightnesses();
  }

  // 각 별의 초기 밝기를 랜덤으로 설정
  void _initializeBrightnesses() {
    for (int i = 0; i < brightnesses.length; i++) {
      brightnesses[i] = 0.5 + random.nextDouble() * 0.5;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.5;

    for (int i = 0; i < starPositions.length; i++) {
      // 밝기에 따라 별의 색상을 결정
      paint.color = color.withOpacity(brightnesses[i]);

      // 별을 그리기
      canvas.drawCircle(
        starPositions[i],
        4.0, // 별의 크기를 조정
        paint
          ..maskFilter = MaskFilter.blur(
            BlurStyle.normal,
            _convertRadiusToSigma(animationValue + 1),
          ),
      );

      // 밝기 업데이트
      _updateBrightness(i);
    }
  }

  // 별의 밝기 업데이트
  void _updateBrightness(int index) {
    const double minBrightness = 0.000000000001;
    const double maxBrightness = 1.0;
    const double brightnessRange = maxBrightness - minBrightness;

    // 현재 시각을 이용해 사인 값 계산 (-1 ~ 1)
    double currentTime = DateTime.now().millisecondsSinceEpoch.toDouble();
    double sinValue = sin(currentTime / 1000000000);  // 밝기 변동 속도 조정

    // 사인 값의 범위를 밝기 범위에 맞게 변환
    double adjustedSinValue = (sinValue + 1) / 2; // 0 ~ 1

    // 범위 내의 밝기로 변환
    brightnesses[index] = minBrightness + adjustedSinValue * brightnessRange;
  }

  // 반지름을 시그마 값으로 변환
  double _convertRadiusToSigma(double radius) {
    if (radius <= 0) {
      return 1;
    }
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(covariant StarPainter oldDelegate) {
    // 별의 위치나 밝기 등이 변했을 경우에만 다시 그리기
    return oldDelegate.animationValue != animationValue;
  }
}