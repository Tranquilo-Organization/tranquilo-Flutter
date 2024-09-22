import 'package:flutter/material.dart';

class RingIndicatorPainter extends CustomPainter {
  final Color color;
  final double progress;

  RingIndicatorPainter({
    required this.color,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double strokeWidth = 5.0;
    const double padding = 12.0;
    final Rect rect = Rect.fromLTWH(
      padding,
      padding,
      size.width - 2 * padding,
      size.height - 2 * padding,
    );
    final double sweepAngle = 2 * 3.141592653589793 * progress;
    canvas.drawArc(
      rect,
      -3.141592653589793 / 2,
      2 * 3.141592653589793,
      false,
      Paint()
        ..color = color.withOpacity(0.2)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
    );
    canvas.drawArc(
      rect,
      -3.141592653589793 / 2,
      sweepAngle,
      false,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
