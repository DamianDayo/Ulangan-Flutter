import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulangan_flutter/components/title_text.dart';
import 'package:ulangan_flutter/database_helper.dart';
import 'package:ulangan_flutter/routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final creators = [
      ["Diogenes", "assets/Damian.jpg"],
      ["Jordan Thomas", "assets/Jordan.jpg"],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const TitleText(
          text: "Profile",
          fontSize: 30,
          color: Color.fromARGB(255, 255, 230, 0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...creators.map(
              (creator) => Column(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(creator[1]),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    " ${creator[0]}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                onPressed: () {
                  Get.defaultDialog(
                    title: "Logout",
                    middleText: "Are you sure you want to logout?",
                    textCancel: "No",
                    textConfirm: "Yes",
                    confirmTextColor: Colors.white,
                    onConfirm: () async {
                      final dbHelper = DatabaseHelper.instance;
                      await dbHelper.logout();
                      Get.offAllNamed(AppRoutes.loginPage);
                      Get.offAllNamed(AppRoutes.loginPage);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
