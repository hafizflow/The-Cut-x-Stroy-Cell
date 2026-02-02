import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  // Observable index for the current page
  var currentIndex = 0.obs;

  final PageController pageController = PageController();

  void changePage(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
