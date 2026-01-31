import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/screen_title.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_extension/views/screen/upload/widgets/custom_stepper.dart';
import 'package:flutter_extension/views/screen/upload/widgets/video_upload.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              spacing: 8.w,
              children: [
                SvgImageWidget.asset(Logos.video, width: 16.w, height: 16.h),
                Text("Main Video", style: AppTextStyles.title14_w500()),
              ],
            ),
            const VideoUploadWidget(),
          ],
        ),
      ),
    );
  }
}
