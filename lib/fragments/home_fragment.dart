import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/home_controller.dart';
import 'package:ulangan_flutter/pages/home/home_page.dart';

class HomeFragment extends StatelessWidget {
  HomeFragment({super.key});

  final HomeController c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}