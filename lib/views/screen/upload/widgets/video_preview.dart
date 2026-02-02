import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/video_upload_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPreview extends StatelessWidget {
  const VideoPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoUploadController controller = Get.find<VideoUploadController>();

    return Obx(() {
      if (controller.videoController.value == null) {
        return const SizedBox.shrink();
      }

      final videoController = controller.videoController.value!;
      final aspectRatio = videoController.value.aspectRatio;
      final width = 228.h * aspectRatio;

      return Stack(
        children: [
          Container(
            height: 228.h,
            width: 343.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: VideoPlayer(videoController),
              ),
            ),
          ),
          Positioned(
            top: 8.h,
            right: 8.w,
            child: IconButton(
              onPressed: controller.removeVideo,
              icon: const Icon(Icons.close),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black54,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: IconButton(
                onPressed: controller.togglePlayPause,
                icon: Icon(
                  videoController.value.isPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled,
                  size: 64.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
