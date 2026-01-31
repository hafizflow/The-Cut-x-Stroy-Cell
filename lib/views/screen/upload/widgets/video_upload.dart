import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_extension/views/screen/upload/widgets/dashed_printer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoUpload extends StatelessWidget {
  const VideoUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 228.h,
      decoration: BoxDecoration(
        color: AppColors.lightYellow,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: CustomPaint(
        painter: DashedRectPainter(
          color: AppColors.dotedBorderRed,
          strokeWidth: 1.0,
          gap: 5.0,
        ),
        child: InkWell(
          onTap: () async {
            final result = await FilePicker.platform.pickFiles(
              allowedExtensions: ['mp4', 'mov', 'avif'],
              type: FileType.video,
            );
            if (result == null) return;

            final file = result.files.first;
          },
          borderRadius: BorderRadius.circular(4.r),
          child: Center(
            child: Column(
              spacing: 8.h,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: const Color(0xFFB71C1C),
                  child: SvgImageWidget.asset(
                    Logos.videoUpload,
                    width: 30.w,
                    height: 30.h,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Tap to select video",
                  style: AppTextStyles.title14_w400(),
                ),
                Text(
                  "MP4, MOV, AVIF (Max 500MB)",
                  style: AppTextStyles.title14_w400(color: AppColors.greyColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
