import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/profile_controller.dart';
import 'package:ulangan_flutter/pages/profile/profile_mobile_page.dart';
import 'package:ulangan_flutter/pages/profile/profile_widescreen_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(() => controller.isMobile.value
              ? ProfileMobilePage()
              : ProfileWidescreenPage());
        },
      ),
    );
  }
}