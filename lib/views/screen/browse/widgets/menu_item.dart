import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/filter_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.title, required this.controller});

  final String title;
  final FilterController controller;

  @override
  Widget build(BuildContext context) {
    return MenuItemButton(
      onPressed: () => controller.setSort(title),
      child: Container(
        width: 130.w,
        padding: EdgeInsets.symmetric(vertical: 0.h),
        child: Obx(() {
          final isSelected = controller.selectedSort.value == title;
          return Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          );
        }),
      ),
    );
  }
}
