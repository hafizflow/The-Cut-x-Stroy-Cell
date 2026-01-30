import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeUnit extends StatelessWidget {
  final String value;
  final String label;

  const TimeUnit({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 71.w,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.lightRed,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.borderRed, width: 1),
      ),
      child: Column(
        children: [
          Text(value, style: AppTextStyles.title20_w500()),
          Text(label, style: AppTextStyles.title12_w400()),
        ],
      ),
    );
  }
}