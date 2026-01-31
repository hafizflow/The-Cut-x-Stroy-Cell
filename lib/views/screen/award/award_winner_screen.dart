import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/screen_title.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_extension/views/screen/award/widgets/award_card.dart';
import 'package:flutter_extension/views/screen/award/widgets/stat_line.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AwardWinnerScreen extends StatelessWidget {
  const AwardWinnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const ScreenTitle(title: "Monthly Awards", backButton: true),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.lightYellow,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.selectedNavColor, width: 1),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20.w,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: AppColors.searchFieldBorderColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: SvgImageWidget.asset(
                      Logos.champion,
                      color: Colors.black,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2.h,
                    children: [
                      Text(
                        "1st Place",
                        style: AppTextStyles.title14_w400(
                          color: AppColors.darkBrown,
                        ),
                      ),
                      Text(
                        "The Last Frame",
                        style: AppTextStyles.title14_w500(),
                      ),
                      Text(
                        "Sarah Chen",
                        style: AppTextStyles.title12_w400(
                          color: AppColors.greyColor,
                        ),
                      ),
                      const StatLine(rating: 4.5, voteCount: 2045),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AwardCard(
                  iconAsset: Logos.secondPlace,
                  rankText: "2nd",
                  title: "Midnight Whispers",
                  author: "Sarah Chen",
                  rating: 4.9,
                  voteCount: 2340,
                  borderColor: AppColors.selectedNavColor,
                  iconColor: Colors.black,
                  onTap: () {
                    debugPrint("Award card tapped");
                  },
                ),

                AwardCard(
                  iconAsset: Logos.thirdPlace,
                  rankText: "3rd",
                  title: "Midnight Whispers",
                  author: "Sarah Chen",
                  rating: 4.9,
                  voteCount: 2340,
                  borderColor: AppColors.selectedNavColor,
                  iconColor: Colors.black,
                  onTap: () {
                    debugPrint("Award card tapped");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
