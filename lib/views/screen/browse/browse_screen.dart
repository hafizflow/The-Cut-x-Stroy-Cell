import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/filter_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/custom_card.dart';
import 'package:flutter_extension/views/base/screen_title.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_extension/views/screen/browse/widgets/category_clip.dart';
import 'package:flutter_extension/views/screen/browse/widgets/menu_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BrowseScreen extends StatelessWidget {
  BrowseScreen({super.key});

  final controller = Get.put(FilterController());

  final List<String> _categories = [
    "All",
    "Drama",
    "Romance",
    "Thriller",
    "Comedy",
    "Trending",
    "Award Winners",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenTitle(title: "Discover"),
              SizedBox(height: 20.h),
              const CustomTextField(),
              SizedBox(height: 16.h),
              Row(
                spacing: 12.w,
                children: [
                  GestureDetector(
                    onTap: () => controller.toggleFilter(),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.deepRed,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Row(
                        spacing: 4.w,
                        children: [
                          SvgImageWidget.asset(
                            Logos.filter,
                            height: 24.h,
                            width: 24.w,
                          ),
                          Text(
                            "Filters",
                            style: AppTextStyles.title16_w500(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Inside your Row in BrowseScreen
                  MenuAnchor(
                    style: MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.grey),
                      elevation: const WidgetStatePropertyAll(8),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                    menuChildren: [
                      // Dropdown Items
                      MenuItem(title: "Trending", controller: controller),
                      const Divider(height: 1, color: Colors.grey),
                      MenuItem(title: "Top Rated", controller: controller),
                      const Divider(height: 1, color: Colors.grey),
                      MenuItem(title: "Newest", controller: controller),
                    ],
                    builder: (context, menuController, child) {
                      return GestureDetector(
                        onTap: () {
                          if (menuController.isOpen) {
                            menuController.close();
                          } else {
                            menuController.open();
                          }
                        },
                        child: Obx(
                          () => Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.deepRed,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.selectedSort.value,
                                  style: AppTextStyles.title16_w500(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Transform.rotate(
                                  angle: menuController.isOpen
                                      ? 3.1416 / 2
                                      : 3.1416 / -2,
                                  child: SvgImageWidget.asset(
                                    Logos.arrowLeft,
                                    height: 24.h,
                                    width: 24.w,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              // 3. The Reactive Categories Panel
              Obx(
                () => controller.isFilterVisible.value
                    ? Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: AppColors.lightYellow,
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: AppColors.yellow,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Categories",
                                  style: AppTextStyles.title16_w500(
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Wrap(
                                  spacing: 16.w,
                                  runSpacing: 8.h,
                                  children: _categories
                                      .map(
                                        (cat) => CategoryClip(
                                          controller: controller,
                                          label: cat,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              Text(
                "5 Films found",
                style: AppTextStyles.title14_w400(color: AppColors.greyColor),
              ),
              SizedBox(height: 8.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.h,
                  crossAxisSpacing: 20.w,
                  childAspectRatio: 161.5 / 235,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CustomCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(),
      decoration: InputDecoration(
        hintText: 'Search dramas, films, creators...',
        hintStyle: AppTextStyles.title14_w400(color: AppColors.greyColor),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            top: 16.h,
            bottom: 16.h,
            right: 8.w,
          ),
          child: SvgImageWidget.asset(
            Logos.search,
            color: AppColors.greyColor,
            height: 24.h,
            width: 24.w,
          ),
        ),
        filled: true,
        fillColor: AppColors.lightRed,
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0.r),
          borderSide: BorderSide(
            color: AppColors.searchFieldBorderColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0.r),
          borderSide: BorderSide(
            color: AppColors.searchFieldBorderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0.r),
          borderSide: BorderSide(
            color: AppColors.searchFieldBorderColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
