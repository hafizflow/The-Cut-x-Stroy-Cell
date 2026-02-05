import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/video_player_controller.dart';
import 'package:flutter_extension/util/app_text_style.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:flutter_extension/views/base/custom_video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 354.h,
                child: CustomVideoPlayerWidget(
                  videoList: [
                    Images.demoVideo1,
                    Images.demoVideo2,
                    Images.demoVideo3,
                    Images.demoVideo1,
                    Images.demoVideo2,
                    Images.demoVideo3,
                    Images.demoVideo1,
                    Images.demoVideo2,
                    Images.demoVideo3,
                  ],
                  autoPlay: false,
                  looping: false,
                  isAsset: false,
                  initialIndex: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
