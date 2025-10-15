import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/components/custom_button.dart';
import 'package:ulangan_flutter/components/custom_textfield.dart';
import 'package:ulangan_flutter/components/title_text.dart';
import 'package:ulangan_flutter/controllers/login_controller.dart';

class LoginMobilePage extends StatelessWidget {
  const LoginMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController auth = Get.find();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 200, 200),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.list_alt_rounded,
                  size: 100,
                  color: Colors.blue,
                ),
                const SizedBox(height: 20),

                const TitleText(
                  text: 'ToDo App',
                  fontSize: 34,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 8),

                const Text(
                  'Silakan masukkan username dan password Anda',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                CustomInputField(
                  label: 'Username',
                  controller: auth.txtUsername,
                  prefixIcon: Icons.person,
                ),
                CustomInputField(
                  label: 'Password',
                  controller: auth.txtPassword,
                  obscure: true,
                  prefixIcon: Icons.lock,
                ),

                const SizedBox(height: 20),

                Obx(
                  () => CustomButton(
                    text: auth.isLoading.value ? 'Loading...' : 'Login',
                    onPressed: () {
                      if (!auth.isLoading.value) auth.handleLogin();
                    },
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}