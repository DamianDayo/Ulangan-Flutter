import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/home_controller.dart';
import 'package:ulangan_flutter/pages/home/home_mobile_page.dart';
import 'package:ulangan_flutter/pages/home/home_widescreen_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(() => controller.isMobile.value
              ? HomeMobilePage()
              : HomeWidescreenPage());
        },
      ),
    );
  }
}