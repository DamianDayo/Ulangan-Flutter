import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/components/custom_button.dart';
import 'package:ulangan_flutter/components/custom_textfield.dart';
import 'package:ulangan_flutter/components/title_text.dart';
import 'package:ulangan_flutter/controllers/edit_todo_controller.dart';
import 'package:ulangan_flutter/controllers/home_controller.dart';

class EditTodoMobilePage extends StatelessWidget {
  const EditTodoMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final EditTodoController c = Get.find();
    final HomeController home = Get.find();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 200, 200),
      appBar: AppBar(title: const TitleText(
          text: "Edit ToDo",
          fontSize: 30,       
          color: Colors.red, 
        ),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomInputField(label: "Judul", controller: c.titleController),
            CustomInputField(label: "Deskripsi", controller: c.descController),
            GestureDetector(
              onTap: () => c.pickDeadline(context),
              child: AbsorbPointer(
                child: CustomInputField(
                  label: "Tenggat",
                  controller: c.deadlineController,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => DropdownButton<int>(
                value: c.selectedCategory.value,
                items: List.generate(
                  home.categories.length,
                  (i) => DropdownMenuItem(
                    value: i,
                    child: Text(home.categories[i]),
                  ),
                ),
                onChanged: (val) => c.selectedCategory.value = val ?? 0,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Simpan",
              onPressed: c.saveTodo,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}