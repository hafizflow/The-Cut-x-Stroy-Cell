import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.title, this.backButton = false});

  final String title;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 64.h),
      child: Row(
        spacing: 8.w,
        children: [
          if (backButton)
            ZoomTapAnimation(
              onTap: () => Navigator.pop(context),
              child: SvgImageWidget.asset(
                Logos.arrowLeft,
                color: AppColors.navbarColor,
              ),
            ),

          Text(title, style: AppTextStyles.title20_w500()),
        ],
      ),
    );
  }
}
