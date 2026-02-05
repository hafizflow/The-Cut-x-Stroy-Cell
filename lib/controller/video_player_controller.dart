import 'package:get/get.dart';
import 'package:video_player/video_player.dart' as vp;

class CustomVideoPlayerController extends GetxController {
  vp.VideoPlayerController? videoController;

  final RxBool isInitialized = false.obs;
  final RxBool showControls = true.obs;
  final RxInt currentIndex = 0.obs;

  final List<String> videoList;
  final bool autoPlay;
  final bool looping;
  final bool isAsset;

  CustomVideoPlayerController({
    required this.videoList,
    this.autoPlay = false,
    this.looping = false,
    this.isAsset = true,
    int initialIndex = 0,
  }) {
    currentIndex.value = initialIndex;
  }

  @override
  void onInit() {
    super.onInit();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    isInitialized.value = false;

    if (videoController != null) {
      await videoController!.pause();
      videoController!.removeListener(update);
      await videoController!.dispose();
      videoController = null;
    }

    await Future.delayed(const Duration(milliseconds: 100));

    try {
      if (isAsset) {
        videoController = vp.VideoPlayerController.asset(
          videoList[currentIndex.value],
        );
      } else {
        videoController = vp.VideoPlayerController.networkUrl(
          Uri.parse(videoList[currentIndex.value]),
        );
      }

      await videoController!.initialize();
      videoController!.setLooping(looping);
      videoController!.addListener(update);

      isInitialized.value = true;

      if (autoPlay) {
        await videoController!.play();
      }

      update();
    } catch (e) {
      print('Error initializing video: $e');
      isInitialized.value = false;
    }
  }

  void togglePlayPause() {
    if (videoController == null || !isInitialized.value) return;

    videoController!.value.isPlaying
        ? videoController!.pause()
        : videoController!.play();
    update();
  }

  void toggleControls() {
    showControls.toggle();
  }

  Future<void> playNextVideo() async {
    if (currentIndex.value < videoList.length - 1) {
      currentIndex.value++;
    } else {
      currentIndex.value = 0;
    }
    await _initializeVideo();
  }

  void toggleVolume() {
    if (videoController == null || !isInitialized.value) return;

    videoController!.setVolume(videoController!.value.volume > 0 ? 0 : 1);
    update();
  }

  String formatDuration(Duration d) =>
      '${d.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
      '${d.inSeconds.remainder(60).toString().padLeft(2, '0')}';

  @override
  void onClose() {
    if (videoController != null) {
      videoController!.removeListener(update);
      videoController!.dispose();
    }
    super.onClose();
  }
}
