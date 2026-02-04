import 'package:get/get.dart';
import 'package:video_player/video_player.dart' as vp;

class CustomVideoPlayerController extends GetxController {
  late vp.VideoPlayerController videoController;

  final RxBool isInitialized = false.obs;
  final RxBool showControls = true.obs;

  final String assetPath;
  final bool autoPlay;
  final bool looping;

  CustomVideoPlayerController({
    required this.assetPath,
    this.autoPlay = false,
    this.looping = false,
  });

  @override
  void onInit() {
    super.onInit();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    videoController = vp.VideoPlayerController.asset(assetPath);

    await videoController.initialize();
    videoController.setLooping(looping);
    isInitialized.value = true;

    if (autoPlay) {
      videoController.play();
    }

    videoController.addListener(update);
  }

  void togglePlayPause() {
    videoController.value.isPlaying
        ? videoController.pause()
        : videoController.play();
    update();
  }

  void toggleControls() {
    showControls.toggle();
  }

  void skipForward() {
    final newPosition =
        videoController.value.position + const Duration(seconds: 10);
    videoController.seekTo(
      newPosition < videoController.value.duration
          ? newPosition
          : videoController.value.duration,
    );
  }

  void toggleVolume() {
    videoController.setVolume(videoController.value.volume > 0 ? 0 : 1);
    update();
  }

  String formatDuration(Duration d) =>
      '${d.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
      '${d.inSeconds.remainder(60).toString().padLeft(2, '0')}';

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
