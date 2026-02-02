import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/main_wrapper_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_extension/views/screen/award/award_screen.dart';
import 'package:flutter_extension/views/screen/browse/browse_screen.dart';
import 'package:flutter_extension/views/screen/home/home_screen.dart';
import 'package:flutter_extension/views/screen/profile/profile_screen.dart';
import 'package:flutter_extension/views/screen/upload/upload_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final MainWrapperController controller = Get.put(MainWrapperController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: controller.animateToTab,
        controller: controller.pageController,
        physics: const BouncingScrollPhysics(),
        children: [
          const HomeScreen(),
          BrowseScreen(),
          const AwardScreen(),
          const UploadScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          notchMargin: 0,
          elevation: 0,
          // height: 90.h,
          color: AppColors.backgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              height: 44.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _bottomAppBarItem(
                    context,
                    icon: Logos.home,
                    page: 0,
                    label: 'Home',
                  ),
                  _bottomAppBarItem(
                    context,
                    icon: Logos.search,
                    page: 1,
                    label: 'Browse',
                  ),
                  _bottomAppBarItem(
                    context,
                    icon: Logos.award,
                    page: 2,
                    label: 'Awards',
                  ),
                  _bottomAppBarItem(
                    context,
                    icon: Logos.upload,
                    page: 3,
                    label: 'Upload',
                  ),
                  _bottomAppBarItem(
                    context,
                    icon: Logos.user,
                    page: 4,
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(
    BuildContext context, {
    required icon,
    required page,
    required label,
  }) {
    return ZoomTapAnimation(
      onTap: () => controller.gotoPage(page),
      child: Container(
        color: Colors.transparent,
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 2.h,
            children: [
              SvgImageWidget.asset(
                icon,
                width: 24.w,
                height: 24.h,
                color: controller.currentPage.value == page
                    ? AppColors.selectedNavColor
                    : AppColors.unselectedNavColor,
              ),
              Text(
                label,
                style: AppTextStyles.title12_w500(
                  color: controller.currentPage.value == page
                      ? AppColors.selectedNavColor
                      : AppColors.unselectedNavColor,
                ),
              ),

              if (controller.currentPage.value == page)
                Container(
                  padding: EdgeInsets.only(top: 4.h),
                  width: 16.w,
                  height: 2.h,
                  color: AppColors.selectedNavColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
