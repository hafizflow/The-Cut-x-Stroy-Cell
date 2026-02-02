import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;

  const CustomStepper({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildStep(1, "Upload", currentStep >= 1),
        _buildDivider(),
        _buildStep(2, "Details", currentStep >= 2),
        _buildDivider(),
        _buildStep(3, "Legal", currentStep >= 3),
      ],
    );
  }

  Widget _buildStep(int stepNumber, String title, bool isActive) {
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
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Text(
              stepNumber.toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
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

  Widget _buildDivider() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 9.w),
        child: Container(
          height: 2.h,
          margin: EdgeInsets.symmetric(horizontal: 9.w),
          color: AppColors.greyColor.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}
