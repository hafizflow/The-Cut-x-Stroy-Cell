import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/screen/upload/widgets/info_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.lightRed,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.borderRed, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              SvgPicture.asset(Logos.information, width: 18.w, height: 18.h),
              SizedBox(width: 8.w),
              Text("Before You Upload", style: AppTextStyles.title16_w400()),
            ],
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 34.w),
            child: Column(
              spacing: 8.h,
              children: const [
                InfoItem("Ensure your video meets."),
                InfoItem("Check the video."),
                InfoItem("Make sure you have."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
