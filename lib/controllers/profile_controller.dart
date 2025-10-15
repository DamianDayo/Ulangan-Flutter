import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulangan_flutter/routes/routes.dart';

class ProfileController extends GetxController {
  final creators = [
    ["Diogenes Damian", "assets/Damian.jpg"],
    ["Jordan Thomas", "assets/Jordan.jpg"],
  ];

  var isMobile = true.obs;
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('username');
    Get.offAllNamed(AppRoutes.splashscreenPage);
  }
}