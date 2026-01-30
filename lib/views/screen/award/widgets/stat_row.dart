import 'package:flutter/cupertino.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/screen/award/widgets/stat_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatRow extends StatelessWidget {
  const StatRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      children: [
        StatCard(
          icon: Logos.thumbs,
          iconBgColor: AppColors.redBg,
          value: '05',
          label: 'Your Votes',
        ),
        StatCard(
          icon: Logos.growth,
          iconBgColor: AppColors.greenBg,
          value: '2.4k',
          label: 'Total Votes',
        ),
        StatCard(
          icon: Logos.badge,
          iconBgColor: AppColors.yellowBg,
          value: '12',
          label: 'Nominees',
        ),
      ],
    );
  }
}
