import 'package:flutter/widgets.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_extension/views/screen/award/widgets/time_unit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VotingTimer extends StatelessWidget {
  const VotingTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.lightYellow,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.selectedNavColor, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SvgImageWidget.asset(
                Logos.time,
                width: 24.w,
                height: 24.h,
                color: AppColors.redBg,
              ),
              SizedBox(width: 8.w),
              Text('Voting End In', style: AppTextStyles.title16_w400()),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12.w,
            children: const [
              TimeUnit(value: '05', label: 'Days'),
              TimeUnit(value: '12', label: 'Hours'),
              TimeUnit(value: '33', label: 'Mins'),
              TimeUnit(value: '18', label: 'Secs'),
            ],
          ),
        ],
      ),
    );
  }
}
