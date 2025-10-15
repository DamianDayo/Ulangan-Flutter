import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulangan_flutter/routes/routes.dart';

class SplashscreenController extends GetxController {
  final bool fromLogin;

  var isMobile = true.obs;
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  SplashscreenController({this.fromLogin = false});

  @override
  void onInit() {
    super.onInit();
    _startSplash();
  }

  Future<void> _startSplash() async {
    await Future.delayed(const Duration(seconds: 2));

    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Get.offAllNamed(AppRoutes.mainMenuPage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}