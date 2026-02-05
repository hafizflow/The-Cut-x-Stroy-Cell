import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/video_player_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/custom_video_player.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_extension/views/screen/upload/widgets/info_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 354.h,
                child: CustomVideoPlayerWidget(
                  videoList: [
                    Images.demoVideo1,
                    Images.demoVideo2,
                    Images.demoVideo3,
                    Images.demoVideo1,
                    Images.demoVideo2,
                    Images.demoVideo3,
                    Images.demoVideo1,
                    Images.demoVideo2,
                    Images.demoVideo3,
                  ],
                  autoPlay: false,
                  looping: false,
                  isAsset: false,
                  initialIndex: 0,
                ),
              ),
              SizedBox(height: 14.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  spacing: 16.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heading(),
                    about(),
                    ratingClips(),
                    revenue(),
                    viewAnalytics(),
                    interactionSection(),
                    festivalCard(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12.h,
                      children: [
                        sectionHeader("Festival History"),
                        filmFestivalCard(),
                        interNationalFilmFestivalCard(),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container interNationalFilmFestivalCard() {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.yellowBorder),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                Text(
                  'Toronto International Film Festival',
                  style: AppTextStyles.title16_w500(),
                ),
                Text(
                  'Was unavailable: Aug 28, 2024 - Sep 20, 2024',
                  style: AppTextStyles.title14_w400(color: AppColors.greyColor),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.5.h),
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Text(
              'Completed',
              style: AppTextStyles.title12_w500(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Container filmFestivalCard() {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightYellow,
        border: Border.all(color: AppColors.yellowBorder),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.h,
            children: [
              Text(
                'Sundance Film Festival 2025',
                style: AppTextStyles.title16_w500(),
              ),
              Text(
                'Made unavailable: Jan 15, 2025',
                style: AppTextStyles.title14_w400(color: AppColors.greyColor),
              ),
              Text(
                'Expected return: Feb 15, 2025',
                style: AppTextStyles.title14_w400(color: AppColors.greyColor),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.5.h),
            decoration: BoxDecoration(
              color: AppColors.greenBgWithOpacity,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Text(
              'Active',
              style: AppTextStyles.title12_w500(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Text sectionHeader(String text) {
    return Text(text, style: AppTextStyles.title16_w400());
  }

  Widget festivalCard() {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.lightRed,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.borderRed, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.redBg,
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: SvgImageWidget.asset(Logos.gift, color: Colors.white),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Festival-Safe Protection",
                      style: AppTextStyles.title16_w500(),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Submitting your film to festivals that require premiere status? We've got you covered. You can temporarily make your film unavailable on our platform to maintain festival eligibility while preserving your account standing.",
                      style: AppTextStyles.title12_w400(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Column(
            spacing: 8.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoCard("No penalties or restrictions"),
              infoCard("Instant activation/deactivation"),
              infoCard("Track multiple festivals"),
            ],
          ),
        ],
      ),
    );
  }

  Row infoCard(String text) {
    return Row(
      spacing: 8.w,
      children: [
        Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            color: AppColors.redBg,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: SvgImageWidget.asset(Logos.tick, width: 18.w, height: 18.h),
        ),
        Text(text),
      ],
    );
  }

  Row interactionSection() {
    return Row(
      spacing: 8.w,
      children: [
        interactionButton(Logos.love, '1.2K'),
        interactionButton(Logos.comment, 'Review'),
        interactionButton(Logos.share, 'Share'),
      ],
    );
  }

  Widget interactionButton(String icon, String label) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppColors.greyBg,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          spacing: 9.w,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgImageWidget.asset(icon, color: Colors.black),
            Text(label, style: AppTextStyles.title14_w400(color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Container viewAnalytics() {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greenBg),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Text(
          'View Analytics',
          style: AppTextStyles.title12_w500(color: AppColors.deepGreen),
        ),
      ),
    );
  }

  Container revenue() {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightgreenBg,
        border: Border.all(color: AppColors.greenBg),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 4.h,
        children: [
          Text('Revenue Earned', style: AppTextStyles.title12_w400()),
          Text('\$342.50', style: AppTextStyles.title14_w500()),
        ],
      ),
    );
  }

  Column about() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12.h,
      children: [
        Text("About", style: AppTextStyles.title16_w400()),
        Text(
          "A photographer races against time to capture the final moments of a disappearing world.",
          style: AppTextStyles.title14_w400(color: AppColors.greyColor),
        ),
      ],
    );
  }

  Row heading() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Midnight Dreams', style: AppTextStyles.title20_w500()),
            const SizedBox(height: 4),
            Text(
              'by Michael Chen',
              style: AppTextStyles.title14_w400(color: AppColors.greyColor),
            ),
          ],
        ),

        // Approved Badge
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.89.w, vertical: 2.5.h),
          decoration: BoxDecoration(
            color: AppColors.greenBg.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Text(
            'Approved',
            style: AppTextStyles.title12_w500(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget buildStatIcon(IconData icon, Color color, String label) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        SizedBox(width: 4.w),
        Text(
          label,
          style: AppTextStyles.title12_w500(color: AppColors.greyColor),
        ),
      ],
    );
  }

  Column ratingClips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          spacing: 16.w,
          children: [
            buildStatIcon(Icons.star, Colors.orangeAccent, '4.9'),
            buildStatIcon(Icons.access_time, AppColors.greyColor, '18:21'),
            buildStatIcon(
              Icons.visibility_outlined,
              AppColors.greyColor,
              '1.1M Views',
            ),
          ],
        ),

        SizedBox(height: 16.h),

        // Section 3: Action Buttons/Chips
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            // Thriller Chip
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13.5.w, vertical: 5.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.redBg),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Text('Thriller', style: AppTextStyles.title12_w500()),
            ),
            // Live & Available Chip
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13.5.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.lightgreenBg,
                border: Border.all(color: AppColors.greenBg),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Text(
                'Live & Available',
                style: AppTextStyles.title12_w500(),
              ),
            ),
            // Download Button
            Container(
              padding: EdgeInsets.symmetric(horizontal: 13.5.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.amber,
                border: Border.all(color: AppColors.amber),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Row(
                spacing: 4.w,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgImageWidget.asset(
                    Logos.download,
                    width: 18.w,
                    height: 18.h,
                  ),
                  Text(
                    'Download',
                    style: AppTextStyles.title12_w500(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
