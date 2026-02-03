import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 161.5.w,
          height: 190.h,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0.r),
            image: DecorationImage(
              image: AssetImage(Images.cardImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // 1. Rating Badge (Top Left)
              Positioned(
                top: 10.h,
                left: 10.w,
                child: _buildBadge(
                  color: AppColors.secondaryColor,
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 12),
                      SizedBox(width: 4.w),
                      Text(
                        "4.9",
                        style: AppTextStyles.title10_w500(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              // 2. "New" Badge (Top Right)
              Positioned(
                top: 10.h,
                right: 10.w,
                child: _buildBadge(
                  color: AppColors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2.5,
                  ),
                  child: Text(
                    "New",
                    style: AppTextStyles.title12_w500(color: Colors.white),
                  ),
                ),
              ),

              // 3. Duration Badge (Bottom Right)
              Positioned(
                bottom: 10.h,
                right: 10.w,
                child: _buildBadge(
                  color: AppColors.secondaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2.5,
                  ),
                  child: Text(
                    "18:21",
                    style: AppTextStyles.title12_w500(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8.h),
        Text(
          "The Great Adventure",
          style: AppTextStyles.title12_w500(color: Colors.black),
        ),
        SizedBox(height: 4.h),
        Text(
          "Thriller | 2.1M",
          style: AppTextStyles.title10_w500(color: AppColors.greyColor),
        ),
      ],
    );
  }

  // Helper method to keep code DRY
  Widget _buildBadge({
    required Color color,
    required Widget child,
    EdgeInsets? padding,
  }) {
    return Container(
      padding: padding ?? const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}
