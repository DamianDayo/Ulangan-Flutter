import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulangan_flutter/controllers/splashscreen_controller.dart';
import 'package:ulangan_flutter/pages/splashscreen/splashscreen_page.dart';

class LoginController extends GetxController {
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();
  var isLoading = false.obs;

  var isMobile = true.obs;
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  bool _validateLogin(String user, String pass) =>
      user == 'Asep' && pass == '123';

  Future<void> handleLogin() async {
    if (! _validateLogin(txtUsername.text, txtPassword.text)) {
      Get.snackbar(
        'Login Gagal',
        'Username atau password salah!',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('username', txtUsername.text.trim());

    Get.offAll(
      () => SplashscreenPage(),
      binding: BindingsBuilder(() {
        Get.put(SplashscreenController(fromLogin: true));
      }),
    );

    Get.snackbar(
      'Login Berhasil',
      'Selamat datang!',
      snackPosition: SnackPosition.TOP,
    );
  }

  @override
  void onClose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}