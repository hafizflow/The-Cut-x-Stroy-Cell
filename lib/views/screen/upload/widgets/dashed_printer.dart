import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DashedRectPainter({
    required this.color,
    this.strokeWidth = 1.0,
    this.gap = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(4.r),
        ),
      );

    Path dashPath = Path();
    for (PathMetric measure in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < measure.length) {
        double nextDistance = distance + gap;
        if (nextDistance > measure.length) {
          nextDistance = measure.length;
        }
        dashPath.addPath(
          measure.extractPath(distance, nextDistance),
          Offset.zero,
        );
        distance += gap * 2;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
