import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/splashscreen_controller.dart';
import 'package:ulangan_flutter/pages/splashscreen/splashscreen_mobile_page.dart';
import 'package:ulangan_flutter/pages/splashscreen/splashscreen_widescreen_page.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});

  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(() => controller.isMobile.value
              ? SplashscreenMobilePage()
              : SplashscreenWidescreenPage());
        },
      ),
    );
  }
}