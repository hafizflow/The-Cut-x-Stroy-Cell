import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoUploadController extends GetxController {
  // Observable variables
  Rx<File?> videoFile = Rx<File?>(null);
  RxBool isUploading = false.obs;
  RxDouble uploadProgress = 0.0.obs;
  Rx<VideoPlayerController?> videoController = Rx<VideoPlayerController?>(null);

  @override
  void onClose() {
    videoController.value?.dispose();
    super.onClose();
  }

  Future<void> pickVideo() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp4', 'mov', 'avi'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;

        // Check file size (500MB = 500 * 1024 * 1024 bytes)
        if (file.size > 500 * 1024 * 1024) {
          Get.snackbar(
            'Error',
            'File size exceeds 500MB limit',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Get.theme.colorScheme.error,
            colorText: Get.theme.colorScheme.onError,
          );
          return;
        }

        // Start uploading
        isUploading.value = true;
        uploadProgress.value = 0.0;

        // Simulate upload progress
        await _simulateUpload();

        if (file.path != null) {
          videoFile.value = File(file.path!);
          isUploading.value = false;

          // Initialize video player
          _initializeVideoPlayer();
        }
      }
    } catch (e) {
      isUploading.value = false;
      Get.snackbar(
        'Error',
        'Error picking video: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
    }
  }

  Future<void> _simulateUpload() async {
    for (int i = 0; i <= 100; i += 5) {
      await Future.delayed(const Duration(milliseconds: 100));
      uploadProgress.value = i / 100;
    }
  }

  void _initializeVideoPlayer() {
    if (videoFile.value != null) {
      videoController.value = VideoPlayerController.file(videoFile.value!)
        ..initialize().then((_) {
          videoController.refresh();
        }).catchError((error) {
          Get.snackbar(
            'Error',
            'Error loading video: $error',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Get.theme.colorScheme.error,
            colorText: Get.theme.colorScheme.onError,
          );
        });
    }
  }

  void removeVideo() {
    videoFile.value = null;
    videoController.value?.dispose();
    videoController.value = null;
    uploadProgress.value = 0.0;
  }

  void togglePlayPause() {
    if (videoController.value != null) {
      if (videoController.value!.value.isPlaying) {
        videoController.value!.pause();
      } else {
        videoController.value!.play();
      }
      videoController.refresh();
    }
  }
}