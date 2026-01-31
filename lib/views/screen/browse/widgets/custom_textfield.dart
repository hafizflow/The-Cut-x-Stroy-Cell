import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(),
      decoration: InputDecoration(
        hintText: 'Search dramas, films, creators...',
        hintStyle: AppTextStyles.title14_w400(color: AppColors.greyColor),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            top: 16.h,
            bottom: 16.h,
            right: 8.w,
          ),
          child: SvgImageWidget.asset(
            Logos.search,
            color: AppColors.greyColor,
            height: 24.h,
            width: 24.w,
          ),
        ),
        filled: true,
        fillColor: AppColors.lightRed,
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0.r),
          borderSide: BorderSide(
            color: AppColors.searchFieldBorderColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0.r),
          borderSide: BorderSide(
            color: AppColors.searchFieldBorderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0.r),
          borderSide: BorderSide(
            color: AppColors.searchFieldBorderColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
