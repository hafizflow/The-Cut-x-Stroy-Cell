import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatLine extends StatelessWidget {
  const StatLine({super.key, required this.rating, required this.voteCount});

  final double rating;
  final int voteCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const SizedBox(width: 4),
        Text(
          rating.toString(),
          style: AppTextStyles.title12_w400(color: AppColors.subHeadingColor),
        ),
        const SizedBox(width: 16),
        SvgImageWidget.asset(
          Logos.thumbs,
          width: 16.w,
          height: 16.h,
          color: AppColors.subHeadingColor,
        ),
        const SizedBox(width: 4),
        Text(
          '$voteCount votes',
          style: AppTextStyles.title12_w400(color: AppColors.subHeadingColor),
        ),
      ],
    );
  }
}
