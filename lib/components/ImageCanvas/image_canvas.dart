import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

class PictureCustomCanvas extends CustomPainter {
  const PictureCustomCanvas({required this.img});

  final ui.Image img;
  @override
  void paint(Canvas canvas, Size size) {
    final customPaint = Paint();
    canvas.drawImage(img, Offset.zero, customPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
