import 'package:get/get.dart';
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
    Get.offAllNamed(AppRoutes.mainMenuPage);
  }
}
