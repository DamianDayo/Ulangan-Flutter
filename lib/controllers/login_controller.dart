import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  var statusLogin = 'Status Login'.obs;

  bool login() {
    if (txtUsername.text == '' && txtPassword.text == '') {
      statusLogin.value = 'Login Berhasil';
      return true;
    } else {
      statusLogin.value = 'Login Gagal';
      return false;
    }
  }

  @override
  void onClose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}