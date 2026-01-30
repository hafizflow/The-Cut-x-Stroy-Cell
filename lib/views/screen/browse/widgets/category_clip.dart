import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/filter_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CategoryClip extends StatelessWidget {
  const CategoryClip({
    super.key,
    required this.controller,
    required this.label,
  });

  final FilterController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isSelected = controller.selectedCategory.value == label;
      return GestureDetector(
        onTap: () => controller.setCategory(label),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.anotherRed : AppColors.lightRed,
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Text(
            label,
            style: AppTextStyles.title12_w400(
              color: isSelected ? Colors.white : AppColors.anotherRed,
            ),
          ),
        ),
      );
    });
  }
}
