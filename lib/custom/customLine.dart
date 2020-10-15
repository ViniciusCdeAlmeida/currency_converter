import 'package:flutter/material.dart';

class CustomLine extends CustomPainter {
  Paint _paint;
  bool reverse;
  Size _deviceSize;

  CustomLine(this.reverse, Size deviceSize) {
    _paint = Paint()
      ..color = Color(0xFFC0CCDA)
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;
    _deviceSize = deviceSize;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (!reverse) {
      canvas.drawLine(
          Offset(10.0, 0.0), Offset(_deviceSize.width / 2.3, 0.0), _paint);
    } else {
      canvas.drawLine(
          Offset(-(_deviceSize.width / 2.3), 0.0), Offset(-10.0, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
