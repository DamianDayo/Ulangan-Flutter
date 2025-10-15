import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/login_controller.dart';
import 'package:ulangan_flutter/pages/login/login_mobile_page.dart';
import 'package:ulangan_flutter/pages/login/login_widescreen_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(() => controller.isMobile.value
              ? const LoginMobilePage()
              : const LoginWidescreenPage());
        },
      ),
    );
  }
}