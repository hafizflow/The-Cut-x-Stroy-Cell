import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_extension/controller/video_player_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/logos.dart';
import 'package:flutter_extension/views/base/svg_image_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPage extends StatefulWidget {
  final String controllerTag;

  const FullScreenVideoPage({super.key, required this.controllerTag});

  @override
  State<FullScreenVideoPage> createState() => _FullScreenVideoPageState();
}

class _FullScreenVideoPageState extends State<FullScreenVideoPage> {
  bool showControls = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  void toggleControls() {
    setState(() {
      showControls = !showControls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomVideoPlayerController>(
      tag: widget.controllerTag,
      builder: (controller) {
        return Obx(() {
          if (!controller.isInitialized.value ||
              controller.videoController == null) {
            return const Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          }

          return Scaffold(
            backgroundColor: Colors.black,
            body: GestureDetector(
              onTap: toggleControls,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Video player
                  Center(
                    child: AspectRatio(
                      aspectRatio:
                          controller.videoController!.value.aspectRatio,
                      child: VideoPlayer(controller.videoController!),
                    ),
                  ),

                  // Gradient overlay
                  if (showControls)
                    IgnorePointer(
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
                    ),

                  // Back button (top left)
                  if (showControls)
                    Positioned(
                      top: 20.h,
                      left: 16.w,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgImageWidget.asset(
                          Logos.arrowLeft,
                          color: Colors.white,
                        ),
                      ),
                    ),

                  // Video counter (top right)
                  if (showControls && controller.videoList.length > 1)
                    Positioned(
                      top: 20.h,
                      right: 16.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          '${controller.currentIndex.value + 1}/${controller.videoList.length}',
                          style: AppTextStyles.title10_w400(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                  // Bottom controls
                  if (showControls)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 16.w,
                          right: 16.w,
                          bottom: 16.h,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Progress bar
                            VideoProgressIndicator(
                              controller.videoController!,
                              allowScrubbing: true,
                              colors: VideoProgressColors(
                                playedColor: AppColors.redBg,
                                bufferedColor: Colors.white.withValues(
                                  alpha: 0.3,
                                ),
                                backgroundColor: Colors.white.withValues(
                                  alpha: 0.2,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 0),
                            ),

                            SizedBox(height: 8.h),

                            // Control buttons row
                            Row(
                              children: [
                                // Play/Pause button
                                GestureDetector(
                                  onTap: controller.togglePlayPause,
                                  child: SvgImageWidget.asset(
                                    controller.videoController!.value.isPlaying
                                        ? Logos.pause
                                        : Logos.play,
                                    color: Colors.white,
                                  ),
                                ),

                                SizedBox(width: 16.w),

                                // Next video button
                                GestureDetector(
                                  onTap: () async {
                                    await controller.playNextVideo();
                                  },
                                  child: Opacity(
                                    opacity: controller.videoList.length > 1
                                        ? 1.0
                                        : 0.5,
                                    child: SvgImageWidget.asset(
                                      Logos.next,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 16.w),

                                // Volume button
                                GestureDetector(
                                  onTap: controller.toggleVolume,
                                  child: Icon(
                                    controller.videoController!.value.volume > 0
                                        ? Icons.volume_up
                                        : Icons.volume_off,
                                    color: Colors.white,
                                    size: 12.sp,
                                  ),
                                ),

                                SizedBox(width: 16.w),

                                // Time display
                                Text(
                                  '${controller.formatDuration(controller.videoController!.value.position)} / ${controller.formatDuration(controller.videoController!.value.duration)}',
                                  style: AppTextStyles.title10_w500(
                                    color: AppColors.greyColor,
                                  ),
                                ),

                                const Spacer(),

                                // Exit fullscreen button
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: SvgImageWidget.asset(
                                    Logos.fullScreen,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
