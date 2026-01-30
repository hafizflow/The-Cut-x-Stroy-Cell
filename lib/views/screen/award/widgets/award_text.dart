import 'package:flutter/cupertino.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AwardText extends StatelessWidget {
  const AwardText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text("December 2025 Awards", style: AppTextStyles.title14_w500()),
        Text(
          "Vote for the best short film of the month. Winners receive prizes and recognition.",
          style: AppTextStyles.title12_w400(color: AppColors.subHeadingColor),
        ),
      ],
    );
  }
}
