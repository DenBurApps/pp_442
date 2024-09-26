import 'dart:math';
import 'package:flutter/material.dart';

class CustomTickIndicator extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double size; // Added size parameter to customize the circle size

  const CustomTickIndicator({
    super.key,
    required this.progress,
    this.size = 150, // Default size of 150 if not provided
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size), // Set the size of the progress indicator
      painter: _TickPainter(progress),
    );
  }
}

class _TickPainter extends CustomPainter {
  final double progress; // The current progress (0.0 to 1.0)

  _TickPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint activeTickPaint = Paint()
      ..color = Colors.white.withOpacity(0.9)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final Paint inactiveTickPaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    const int totalTicks = 60; // Number of ticks (e.g., for 60 seconds)
    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < totalTicks; i++) {
      // Adjust the angle to start from 12:00 (subtract pi/2)
      final double angle = (2 * pi / totalTicks) * i - pi / 2;
      final double startX = center.dx + radius * cos(angle);
      final double startY = center.dy + radius * sin(angle);
      final double endX = center.dx + (radius - 10) * cos(angle);
      final double endY = center.dy + (radius - 10) * sin(angle);

      // Active ticks are drawn with more opacity based on progress
      final Paint tickPaint =
          i / totalTicks <= progress ? activeTickPaint : inactiveTickPaint;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), tickPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
