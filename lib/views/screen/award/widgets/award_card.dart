import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_extension/views/screen/award/widgets/stat_line.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AwardCard extends StatelessWidget {
  final String iconAsset;
  final String rankText;
  final String title;
  final String author;
  final double rating;
  final int voteCount;

  final Color borderColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const AwardCard({
    super.key,
    required this.iconAsset,
    required this.rankText,
    required this.title,
    required this.author,
    required this.rating,
    required this.voteCount,
    this.borderColor = Colors.black,
    this.iconColor = Colors.black,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: onTap,
      child: Container(
        width: 162.w,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Rank Row
            Row(
              spacing: 8.w,
              children: [
                SvgImageWidget.asset(
                  iconAsset,
                  color: iconColor,
                  height: 24.h,
                  width: 24.w,
                ),
                Text(rankText, style: AppTextStyles.title12_w500()),
              ],
            ),

            SizedBox(height: 8.h),

            /// Title
            Text(
              title,
              style: AppTextStyles.title14_w500(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            /// Author
            Text(
              author,
              style: AppTextStyles.title12_w400(
                color: AppColors.subHeadingColor,
              ),
            ),

            SizedBox(height: 6.h),

            /// Rating + Votes
            StatLine(rating: rating, voteCount: voteCount),
          ],
        ),
      ),
    );
  }
}
