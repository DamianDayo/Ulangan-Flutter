import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  String statusLogin = "Status Login";

  void login(VoidCallback onSuccess, VoidCallback onFailure) {
    if (txtUsername.text == "Asep" && txtPassword.text == "Asep123") {
      statusLogin = "Login Berhasil";
      onSuccess();
    } else {
      statusLogin = "Login Gagal";
      onFailure();
    }
  }
}