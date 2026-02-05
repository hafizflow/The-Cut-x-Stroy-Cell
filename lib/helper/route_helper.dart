import 'package:flutter_extension/main_wrapper.dart';
import 'package:flutter_extension/views/screen/home/home_screen.dart';
import 'package:flutter_extension/views/screen/profile/video_screen.dart';
import 'package:get/get.dart';

import '../views/screen/splash/splash_screen.dart';

class AppRoutes {
  static String splashScreen = "/splash_screen";
  static String homeScreen = "/home_screen";
  static String mainWrapper = "/main_wrapper";
  static String videoScreen = "/video_screen";

  static List<GetPage> page = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: mainWrapper, page: () => MainWrapper()),
    GetPage(name: videoScreen, page: () => const VideoScreen()),
  ];
}
