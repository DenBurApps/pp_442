import 'dart:math';
import 'package:flutter/material.dart';

class CustomTickIndicator extends StatelessWidget {
  final double progress;
  final double size;

  const CustomTickIndicator({
    super.key,
    required this.progress,
    this.size = 150,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _TickPainter(progress),
    );
  }
}

class _TickPainter extends CustomPainter {
  final double progress;

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

    const int totalTicks = 60;
    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < totalTicks; i++) {
      final double angle = (2 * pi / totalTicks) * i - pi / 2;
      final double startX = center.dx + radius * cos(angle);
      final double startY = center.dy + radius * sin(angle);
      final double endX = center.dx + (radius - 10) * cos(angle);
      final double endY = center.dy + (radius - 10) * sin(angle);

      final Paint tickPaint =
          i / totalTicks <= progress ? activeTickPaint : inactiveTickPaint;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), tickPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
