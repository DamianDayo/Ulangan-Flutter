import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/history_controller.dart';
import 'package:ulangan_flutter/pages/history/history_mobile_page.dart';
import 'package:ulangan_flutter/pages/history/history_widescreen_page.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final controller = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(() => controller.isMobile.value
              ? const HistoryMobilePage()
              : const HistoryWidescreenPage());
        },
      ),
    );
  }
}