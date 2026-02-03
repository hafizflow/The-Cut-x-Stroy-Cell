import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/navigation_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/screen/profile/pages/activity_page.dart';
import 'package:flutter_extension/views/screen/profile/pages/favourites_page.dart';
import 'package:flutter_extension/views/screen/profile/pages/my_films_page.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieTabsPage extends StatelessWidget {
  const MovieTabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());
    final List<String> tabs = ["My Films", "Favourites", "Activity"];

    return Column(
      spacing: 16.h,
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
        Divider(height: 1.h, color: AppColors.greyColor),

        Obx(
          () => IndexedStack(
            index: controller.currentIndex.value,
            children: const [MyFilmsPage(), FavouritesPage(), ActivityPage()],
          ),
        ),
      ],
    );
  }
}
