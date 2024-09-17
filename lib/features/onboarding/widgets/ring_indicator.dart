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
    final double strokeWidth =
        5.0; // Increase stroke width to make it more visible
    final double padding =
        12.0; // Increased padding to move the ring farther from the edges
    final double radius = size.width / 2;
    final Rect rect = Rect.fromLTWH(
      padding,
      padding,
      size.width - 2 * padding,
      size.height - 2 * padding,
    );
    final double sweepAngle = 2 * 3.141592653589793 * progress;

    // Draw the full circle
    canvas.drawArc(
      rect,
      -3.141592653589793 / 2,
      2 * 3.141592653589793,
      false,
      Paint()
        ..color = color.withOpacity(0.2) // Background color for the ring
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
    );

    // Draw the progress ring
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
