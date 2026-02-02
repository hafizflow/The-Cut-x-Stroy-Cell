import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/navigation_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieTabsPage extends StatelessWidget {
  const MovieTabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());
    final List<String> tabs = ["My Films", "Favourites", "Activity"];

    return Column(
      children: [
        Obx(
          () => Row(
            children: List.generate(tabs.length, (index) {
              bool isActive = controller.currentIndex.value == index;
              return GestureDetector(
                onTap: () => controller.changePage(index),
                child: Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tabs[index],
                        style: GoogleFonts.poppins(
                          color: isActive ? AppColors.redBg : Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 4),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 2,
                        width: isActive ? 60.w : 0,
                        color: AppColors.redBg,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),

        SizedBox(height: 16.h),

        Divider(color: AppColors.greyColor),

        SizedBox(
          height: 400.h,
          child: PageView(
            controller: controller.pageController,
            onPageChanged: (index) => controller.currentIndex.value = index,
            children: const [
              Center(child: Text("My Films Content")),
              Center(child: Text("Favourites Content")),
              Center(child: Text("Activity Content")),
            ],
          ),
        ),
      ],
    );
  }
}
