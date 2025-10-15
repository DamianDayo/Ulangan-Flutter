import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/edit_todo_controller.dart';
import 'package:ulangan_flutter/pages/edit_todo/edit_todo_mobile_page.dart';
import 'package:ulangan_flutter/pages/edit_todo/edit_todo_widescreen_page.dart';

class EditTodoPage extends StatelessWidget {
  EditTodoPage({super.key});

  final controller = Get.find<EditTodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(() => controller.isMobile.value
              ? const EditTodoMobilePage()
              : const EditTodoWidescreenPage());
        },
      ),
    );
  }
}