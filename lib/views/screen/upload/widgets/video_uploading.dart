import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/views/screen/upload/widgets/dashed_printer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class VideoUploading extends StatelessWidget {
  final double progress;

  const VideoUploading({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 81.h,
      decoration: BoxDecoration(
        color: AppColors.lightYellow,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: CustomPaint(
        painter: DashedRectPainter(
          color: AppColors.dotedBorderRed,
          strokeWidth: 1.0,
          gap: 5.0,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Uploading film...",
                    style: AppTextStyles.title14_w400(),
                  ),
                  Text(
                    "${(progress * 100).toInt()}%",
                    style: AppTextStyles.title14_w500(),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              LinearPercentIndicator(
                lineHeight: 8.0,
                percent: progress,
                backgroundColor: AppColors.lightGray.withValues(alpha: 0.2),
                progressColor: AppColors.redBg,
                barRadius: Radius.circular(20.r),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
