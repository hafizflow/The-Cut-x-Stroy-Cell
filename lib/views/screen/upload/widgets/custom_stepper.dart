import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;

  const CustomStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildStep(1, "Upload", currentStep >= 1, currentStep > 1),
        _buildDivider(currentStep >= 2),
        _buildStep(2, "Details", currentStep >= 2, currentStep > 2),
        _buildDivider(currentStep >= 3),
        _buildStep(3, "Legal", currentStep >= 3, false),
      ],
    );
  }

  Widget _buildStep(
    int stepNumber,
    String title,
    bool isActive,
    bool isCompleted,
  ) {
    Color activeColor = AppColors.redBg;
    Color inactiveColor = AppColors.greyColor;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isActive ? activeColor : inactiveColor,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.all(10.w),
          child: isCompleted
              ? SvgImageWidget.asset(
                  Logos.tick,
                  width: 18.w,
                  height: 18.h,
                  color: Colors.white,
                )
              : Center(
                  child: Padding(
                    padding: EdgeInsets.all(3.w),
                    child: Text(
                      stepNumber.toString(),
                      style: AppTextStyles.title16_w600(color: Colors.white),
                    ),
                  ),
                ),
        ),
        SizedBox(width: 8.w),
        Text(
          title,
          style: AppTextStyles.title14_w400(
            color: isActive ? Colors.black : inactiveColor,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(bool isActive) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 9.w),
        child: Container(
          height: 2.h,
          margin: EdgeInsets.symmetric(horizontal: 9.w),
          color: isActive
              ? AppColors.redBg
              : AppColors.greyColor.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}
