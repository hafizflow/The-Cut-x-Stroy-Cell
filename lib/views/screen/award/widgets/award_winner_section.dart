import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_extension/views/screen/award/award_winner_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AwardWinnerSection extends StatelessWidget {
  final String title;
  final String category;
  final String date;

  const AwardWinnerSection({
    super.key,
    required this.title,
    required this.category,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: AppColors.lightYellow,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.selectedNavColor, width: 1),
          ),
          child: Row(
            children: [
              // Circular Award Icon
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.selectedNavColor,
                  shape: BoxShape.circle,
                ),
                child: SvgImageWidget.asset(
                  Logos.badge,
                  width: 24.w,
                  height: 24.h,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 16),
              // Text Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.title14_w400()),
                  const SizedBox(height: 4),
                  Text(
                    '$category | $date',
                    style: AppTextStyles.title12_w400(
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        GestureDetector(
          onTap: () => Get.to(() => const AwardWinnerScreen()),
          child: Container(
            height: 36.h,
            width: 343.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.selectedNavColor, width: 1),
            ),
            child: Center(
              child: Text("View More", style: AppTextStyles.title14_w400()),
            ),
          ),
        ),
      ],
    );
  }
}
