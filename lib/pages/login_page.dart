import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../components/custom_textfield.dart';
import '../components/title_text.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = LoginController();

  void _login() {
    controller.login(
      () => setState(() {}),
      () => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Login")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(text: "Selamat Datang"),
                const SizedBox(height: 10),
                const Text("Silakan masukkan username dan password anda"),

                CustomInputField(
                  label: "Username",
                  controller: controller.txtUsername,
                ),
                CustomInputField(
                  label: "Password",
                  controller: controller.txtPassword,
                  obscure: true,
                ),

                CustomButton(text: "Login", onPressed: _login),

                const SizedBox(height: 20),
                Text(controller.statusLogin),
              ],
            ),
          ),
        ),
      ),
    );
  }
}