import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoUploadWidget extends StatelessWidget {
  const VideoUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9F0),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFB71C1C).withOpacity(0.5),
          style: BorderStyle.none,
        ),
      ),
      child: CustomPaint(
        painter: DashedRectPainter(
          color: const Color(0xFFB71C1C),
          strokeWidth: 1.0,
          gap: 5.0,
        ),
        child: InkWell(
          onTap: () {
            // Handle video selection
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: const Color(0xFFB71C1C),
                child: Icon(
                  Icons.upload_sharp,
                  color: Colors.white,
                  size: 30.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Tap to select video",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "MP4, MOV, AVI (Max 500MB)",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.blueGrey.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Simple Painter for the dashed border effect
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
          Radius.circular(12.r),
        ),
      );

    Path dashPath = Path();
    double distance = 0.0;
    for (PathMetric measure in path.computeMetrics()) {
      while (distance < measure.length) {
        dashPath.addPath(
          measure.extractPath(distance, distance + gap),
          Offset.zero,
        );
        distance += gap * 2;
      }
      distance = 0.0;
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
