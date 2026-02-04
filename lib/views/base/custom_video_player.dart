import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/video_player_controller.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayerWidget extends StatelessWidget {
  final String assetPath;
  final bool autoPlay;
  final bool looping;
  final VoidCallback? onBack;

  const CustomVideoPlayerWidget({
    super.key,
    required this.assetPath,
    this.autoPlay = false,
    this.looping = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    // Create unique tag for this video player instance
    final String tag = 'video_${assetPath.hashCode}';

    // Initialize controller with tag
    Get.put(
      CustomVideoPlayerController(
        assetPath: assetPath,
        autoPlay: autoPlay,
        looping: looping,
      ),
      tag: tag,
    );

    return GetBuilder<CustomVideoPlayerController>(
      tag: tag,
      builder: (controller) {
        if (!controller.isInitialized.value) {
          return Container(
            color: Colors.black,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        }

        return GestureDetector(
          onTap: controller.toggleControls,
          child: Container(
            color: Colors.black,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Video player
                Center(
                  child: AspectRatio(
                    aspectRatio: controller.videoController.value.aspectRatio,
                    child: VideoPlayer(controller.videoController),
                  ),
                ),

                // Gradient overlay
                Obx(
                  () => controller.showControls.value
                      ? IgnorePointer(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withValues(alpha: 0.5),
                                  Colors.transparent,
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.7),
                                ],
                                stops: const [0.0, 0.3, 0.7, 1.0],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),

                // Back button (top left)
                Obx(
                  () => controller.showControls.value && onBack != null
                      ? Positioned(
                          top: MediaQuery.of(context).padding.top + 8,
                          left: 8,
                          child: IconButton(
                            onPressed: onBack,
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),

                // Bottom controls
                Obx(
                  () => controller.showControls.value
                      ? Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 12,
                              right: 12,
                              bottom: MediaQuery.of(context).padding.bottom + 8,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Progress bar
                                VideoProgressIndicator(
                                  controller.videoController,
                                  allowScrubbing: true,
                                  colors: VideoProgressColors(
                                    playedColor: Colors.white,
                                    bufferedColor: Colors.white.withValues(
                                      alpha: 0.3,
                                    ),
                                    backgroundColor: Colors.white.withValues(
                                      alpha: 0.2,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                // Control buttons row
                                Row(
                                  children: [
                                    // Play/Pause button
                                    GestureDetector(
                                      onTap: controller.togglePlayPause,
                                      child: Icon(
                                        controller
                                                .videoController
                                                .value
                                                .isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    ),

                                    const SizedBox(width: 16),

                                    // Skip forward button
                                    GestureDetector(
                                      onTap: controller.skipForward,
                                      child: const Icon(
                                        Icons.skip_next,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    ),

                                    const SizedBox(width: 16),

                                    // Volume button
                                    GestureDetector(
                                      onTap: controller.toggleVolume,
                                      child: Icon(
                                        controller
                                                    .videoController
                                                    .value
                                                    .volume >
                                                0
                                            ? Icons.volume_up
                                            : Icons.volume_off,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    ),

                                    const SizedBox(width: 16),

                                    // Time display
                                    Text(
                                      '${controller.formatDuration(controller.videoController.value.position)} / ${controller.formatDuration(controller.videoController.value.duration)}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),

                                    const Spacer(),

                                    // Fullscreen button
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(
                                          () => Scaffold(
                                            body: CustomVideoPlayerWidget(
                                              assetPath: assetPath,
                                              autoPlay: true,
                                              looping: looping,
                                              onBack: () => Get.back(),
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.fullscreen,
                                        color: Colors.white,
                                        size: 28,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
