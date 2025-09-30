import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulangan_flutter/components/custom_button.dart';
import 'package:ulangan_flutter/components/custom_textfield.dart';
import 'package:ulangan_flutter/components/title_text.dart';
import 'package:ulangan_flutter/controllers/login_controller.dart';
import 'package:ulangan_flutter/controllers/splashscreen_controller.dart';
import 'package:ulangan_flutter/pages/splashscreen_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController auth = Get.find();

      Future<void> _login() async {
      final ok = auth.login();
      if (ok) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("username", auth.txtUsername.text.trim());

        Get.offAll(
          () => SplashscreenPage(),
          binding: BindingsBuilder(() {
            Get.put(SplashscreenController(fromLogin: true));
          }),
        );
      } else {
        Get.snackbar(
          'Gagal',
          'Username atau password salah!',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(text: 'ToDo App'),
                const SizedBox(height: 10),
                const Text('Silakan masukkan username dan password Anda!'),

                CustomInputField(
                  label: 'Username',
                  controller: auth.txtUsername,
                ),
                CustomInputField(
                  label: 'Password',
                  controller: auth.txtPassword,
                  obscure: true,
                ),
                const SizedBox(height: 12),
                CustomButton(text: 'Login', onPressed: _login),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
