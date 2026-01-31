import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InfoItem extends StatelessWidget {
  const InfoItem(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Logos.checkmark, width: 18.w, height: 18.h),
        SizedBox(width: 8.w),
        Expanded(child: Text(text, style: AppTextStyles.title14_w400())),
      ],
    );
  }
}
