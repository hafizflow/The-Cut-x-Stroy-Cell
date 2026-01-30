import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/views/screen/award/widgets/stat_line.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NominationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final double rating;
  final int voteCount;
  final VoidCallback onVotePressed;

  const NominationCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.rating,
    required this.voteCount,
    required this.onVotePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 118.h,
      width: 343.w,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFDECEC),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.borderRed, width: 1),
      ),
      child: Row(
        spacing: 12.w,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              bottomLeft: Radius.circular(8.r),
            ),
            child: Image.asset(
              imageUrl,
              width: 120.w,
              height: 110.h,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.5.h),
            child: Column(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.title14_w400(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'by $author',
                  style: AppTextStyles.title12_w400(
                    color: AppColors.subHeadingColor,
                  ),
                ),
                StatLine(rating: rating, voteCount: voteCount),
                Container(
                  width: 151.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: AppColors.brown,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Center(
                    child: Text(
                      "Vote Now",
                      style: AppTextStyles.title12_w500(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
