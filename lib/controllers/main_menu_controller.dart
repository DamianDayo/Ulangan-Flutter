import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/fragments/history_fragment.dart';
import 'package:ulangan_flutter/fragments/profile_fragment.dart';
import 'package:ulangan_flutter/pages/home_page.dart';

class MainMenuController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = const [
    HomePage(),
    HistoryFragment(),
    ProfileFragment(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}