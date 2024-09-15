
import 'package:flutter/material.dart';

class MyCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const Color fillColor = Colors.white;

    final paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    final path0 = Path();

    path0.moveTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, size.height * 0.20);

    path0.quadraticBezierTo(size.width * 0.005, 0, size.width * 0.10, 0);

    path0.quadraticBezierTo(
        size.width * 0.5, size.height * 0.10, size.width * 0.90, 0);

    path0.quadraticBezierTo(
        size.width * 0.995, 0, size.width, size.height * 0.20);

    path0.close();

    canvas.drawPath(path0, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate != this;
}
