// lib/controllers/temple_controller2.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ojas_app/Screens/Testing/test1.dart';

import '../../models/temple_model.dart';


class TempleController2 extends GetxController {
  final temples = <Temple2>[].obs;
  final currentIndex = 0.obs;

  late final PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(viewportFraction: 0.75);
    fetchTemples();
  }

  void fetchTemples() {
    temples.assignAll([
      Temple2(name: "Shri Swaminarayan Mandir", imageUrl: "assets/temples/temple1.jpg"),
      Temple2(name: "BAPS Mandir",               imageUrl: "assets/temples/temple2.jpg"),
      Temple2(name: "ISKCON Temple",             imageUrl: "assets/temples/temple3.jpg"),
    ]);
  }

  void onPageChanged(int index) => currentIndex.value = index;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
