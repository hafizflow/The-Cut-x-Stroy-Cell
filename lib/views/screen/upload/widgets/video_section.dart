import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/video_upload_controller.dart';
import 'package:flutter_extension/views/screen/upload/widgets/video_preview.dart';
import 'package:flutter_extension/views/screen/upload/widgets/video_upload.dart';
import 'package:flutter_extension/views/screen/upload/widgets/video_uploading.dart';
import 'package:get/get.dart';

class VideoSection extends StatelessWidget {
  const VideoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoUploadController controller = Get.find<VideoUploadController>();

    return Obx(() {
      // Show uploading widget
      if (controller.isUploading.value) {
        return VideoUploading(progress: controller.uploadProgress.value);
      }

      // Show video preview
      if (controller.videoFile.value != null &&
          controller.videoController.value != null &&
          controller.videoController.value!.value.isInitialized) {
        return const VideoPreview();
      }

      // Show upload widget
      return const VideoUpload();
    });
  }
}
