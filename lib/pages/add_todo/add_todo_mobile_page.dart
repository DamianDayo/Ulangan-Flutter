import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/components/title_text.dart';
import 'package:ulangan_flutter/controllers/add_todo_controller.dart';
import 'package:ulangan_flutter/controllers/home_controller.dart';
import 'package:ulangan_flutter/components/custom_textfield.dart';
import 'package:ulangan_flutter/components/custom_button.dart';

class AddTodoMobilePage extends StatelessWidget {
  const AddTodoMobilePage({super.key});

  String _monthName(int month) {
    const names = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
      'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
    ];
    return names[month];
  }

  @override
  Widget build(BuildContext context) {
    final AddTodoController c = Get.find();
    final HomeController homeController = Get.find();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 200, 200),
      appBar: AppBar(
        title: const TitleText(
          text: "Tambah ToDo",
          fontSize: 30,       
          color: Colors.blue, 
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomInputField(label: "Judul", controller: c.titleController),
            const SizedBox(height: 12),
            CustomInputField(label: "Deskripsi", controller: c.descController),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  final formatted =
                      "${picked.day}-${_monthName(picked.month)}-${picked.year}";
                  c.deadlineController.text = formatted;
                }
              },
              child: AbsorbPointer(
                child: CustomInputField(
                  label: "Tenggat",
                  controller: c.deadlineController,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Obx(() => DropdownButton<int>(
                  value: c.selectedCategory.value,
                  items: List.generate(
                    homeController.categories.length,
                    (i) => DropdownMenuItem(
                      value: i,
                      child: Text(homeController.categories[i]),
                    ),
                  ),
                  onChanged: (val) => c.selectedCategory.value = val ?? 0,
                )),
            const SizedBox(height: 20),
            CustomButton(
              text: "Tambah",
              onPressed: c.addTodo,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}