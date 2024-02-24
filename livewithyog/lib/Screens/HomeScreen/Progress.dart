import 'dart:math';

import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  final double progress; // Progress value between 0.0 and 1.0

  CustomCircularProgress({required this.progress});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(100, 100), // Size of the progress meter
      painter: CircularProgressPainter(progress: progress),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;

  CircularProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;
    Paint foregroundPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromRGBO(197, 139, 242, 1),
          Color.fromRGBO(180, 192, 254, 1)
        ],
        stops: [0.0, 1.0], // optional
      ).createShader(Rect.fromLTWH(
          0.0, 0.0, 10, 10)) // Adjust width and height accordingly
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, backgroundPaint);

    double sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
