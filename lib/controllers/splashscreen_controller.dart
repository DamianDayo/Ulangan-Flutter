import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';  
import 'package:ulangan_flutter/routes/routes.dart';

class SplashscreenController extends GetxController {
  final bool fromLogin;

  SplashscreenController({this.fromLogin = false});

  @override
  void onInit() {
    super.onInit();
    _startSplash();
  }

  Future<void> _startSplash() async {
    await Future.delayed(const Duration(seconds: 3));

    if (fromLogin) {
      Get.offAllNamed(AppRoutes.mainMenuPage);
    } else {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.getString("username") != null) {
        Get.offAllNamed(AppRoutes.mainMenuPage);
      } else {
        Get.offAllNamed(AppRoutes.loginPage);
      }
    }
  }
}
