import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/components/custom_button.dart';
import 'package:ulangan_flutter/components/custom_textfield.dart';
import 'package:ulangan_flutter/components/title_text.dart';
import 'package:ulangan_flutter/controllers/login_controller.dart';

class LoginWidescreenPage extends StatelessWidget {
  const LoginWidescreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController auth = Get.find();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 200, 200),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          padding: const EdgeInsets.all(32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.list_alt_rounded,
                      size: 120,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 30),
                    TitleText(
                      text: 'ToDo App',
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Silakan masukkan username dan password Anda',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 60),

              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    const SizedBox(height: 25),
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
            ],
          ),
        ),
      ),
    );
  }
}