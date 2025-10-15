import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/components/custom_button.dart';
import 'package:ulangan_flutter/components/title_text.dart';
import 'package:ulangan_flutter/controllers/profile_controller.dart';

class ProfileWidescreenPage extends StatelessWidget {
  ProfileWidescreenPage({super.key});

  final ProfileController c = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 200, 200),
      appBar: AppBar(
        title: const TitleText(
          text: "Profile",
          fontSize: 30,
          color: Color.fromARGB(255, 255, 230, 0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: c.creators.map(
                (creator) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 52,
                        backgroundImage: AssetImage(creator[1]),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        creator[0],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ).toList(),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 110,
                child: CustomButton(
                  text: "Logout",
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  height: 38,
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: const Text("Logout"),
                        content: const Text("Apakah kamu yakin ingin logout?"),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: CustomButton(
                                  text: "Tidak",
                                  onPressed: () => Get.back(),
                                  backgroundColor: Colors.blue,
                                  textColor: Colors.white,
                                  height: 38,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: CustomButton(
                                  text: "Ya",
                                  onPressed: () async {
                                    await c.logoutUser();
                                  },
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  height: 38,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}