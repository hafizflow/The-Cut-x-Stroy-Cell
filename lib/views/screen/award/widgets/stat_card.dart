import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatCard extends StatelessWidget {
  final String icon;
  final Color iconBgColor;
  final String value;
  final String label;

  const StatCard({
    super.key,
    required this.icon,
    required this.iconBgColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.w),
        decoration: BoxDecoration(
          color: AppColors.lightRed,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.borderRed, width: 1),
        ),
        child: Column(
          spacing: 4.h,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SvgImageWidget.asset(
                icon,
                width: 24.w,
                height: 24.h,
                color: Colors.white,
                fit: BoxFit.scaleDown,
              ),
            ),
            Text(value, style: AppTextStyles.title16_w500()),
            Text(
              label,
              style: AppTextStyles.title12_w400(color: AppColors.greyColor),
            ),
          ],
        ),
      ),
    );
  }
}
