import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/video_upload_controller.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/screen_title.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_extension/views/screen/upload/widgets/custom_stepper.dart';
import 'package:flutter_extension/views/screen/upload/widgets/info_card.dart';
import 'package:flutter_extension/views/screen/upload/widgets/video_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoUploadController controller = Get.put(VideoUploadController());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenTitle(title: "Upload Your Film"),
            SizedBox(height: 12.h),
            Text(
              "Share your creative work with a global audience",
              style: AppTextStyles.title14_w400(),
            ),
            SizedBox(height: 20.h),
            const CustomStepper(currentStep: 1),
            SizedBox(height: 24.h),
            Row(
              children: [
                SvgImageWidget.asset(Logos.video, width: 16.w, height: 16.h),
                SizedBox(width: 8.w),
                Text("Main Video*", style: AppTextStyles.title14_w500()),
              ],
            ),
            SizedBox(height: 8.h),
            const VideoSection(),
            SizedBox(height: 24.h),
            const InfoCard(),
            const Spacer(),
            Obx(
              () => CustomButton(
                onTap: () {},
                text: "Next",
                disabled: controller.videoFile.value == null,
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
