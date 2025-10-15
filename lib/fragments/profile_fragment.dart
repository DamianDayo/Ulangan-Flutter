import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/profile_controller.dart';
import 'package:ulangan_flutter/pages/profile/profile_page.dart';

class ProfileFragment extends StatelessWidget {
  ProfileFragment({super.key});

  final ProfileController c = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return ProfilePage();
  }
}