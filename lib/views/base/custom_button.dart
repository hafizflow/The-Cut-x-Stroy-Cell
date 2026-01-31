import 'package:flutter/material.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import '../../util/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color,
    this.textStyle,
    this.radius,
    this.margin = EdgeInsets.zero,
    required this.onTap,
    required this.text,
    this.loading = false,
    this.width,
    this.height,
  });
  final Function() onTap;
  final String text;
  final bool loading;
  final double? height;
  final double? width;
  final Color? color;
  final double? radius;
  final EdgeInsetsGeometry margin;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ElevatedButton(
        onPressed: loading ? () {} : onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 100.r),
          ),
          backgroundColor: color ?? AppColors.backgroundColor,
          minimumSize: Size(width ?? Get.width, height ?? 53.h),
        ),
        child: loading
            ? SizedBox(
                height: 20.h,
                width: 20.h,
                child: const CircularProgressIndicator(color: Colors.white),
              )
            : Row(
                spacing: 10.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style:
                        textStyle ??
                        AppTextStyles.title16_w500(color: Colors.white),
                  ),

                  SvgImageWidget.asset(
                    Logos.arrowRight,
                    width: 24.w,
                    height: 24.h,
                    color: Colors.white,
                  ),
                ],
              ),
      ),
    );
  }
}
