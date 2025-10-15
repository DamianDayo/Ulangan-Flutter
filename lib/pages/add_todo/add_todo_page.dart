import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/add_todo_controller.dart';
import 'package:ulangan_flutter/pages/add_todo/add_todo_mobile_page.dart';
import 'package:ulangan_flutter/pages/add_todo/add_todo_widescreen_page.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final controller = Get.find<AddTodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(() => controller.isMobile.value
              ? const AddTodoMobilePage()
              : const AddTodoWidescreenPage());
        },
      ),
    );
  }
}