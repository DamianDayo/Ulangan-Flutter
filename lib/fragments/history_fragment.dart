import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/history_controller.dart';
import 'package:ulangan_flutter/pages/history/history_page.dart';

class HistoryFragment extends StatelessWidget {
  HistoryFragment({super.key});

  final HistoryController c = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return HistoryPage();
  }
}