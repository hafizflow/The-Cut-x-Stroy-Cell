import 'package:flutter/material.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/screen_title.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_extension/views/screen/award/widgets/stat_row.dart';
import 'package:flutter_extension/views/screen/profile/widgets/movie_tabs_page.dart';
import 'package:flutter_extension/views/screen/profile/widgets/profile_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ScreenTitle(title: "Profile"),
                  Padding(
                    padding: EdgeInsets.only(top: 64.h),
                    child: SvgImageWidget.asset(
                      Logos.menu,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              const ProfileWidget(),
              SizedBox(height: 16.h),
              const StatRow(),
              SizedBox(height: 16.h),
              const MovieTabsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
