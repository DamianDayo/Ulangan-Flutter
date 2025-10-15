import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/main_menu_controller.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final MainMenuController c = Get.find<MainMenuController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: c.pages[c.selectedIndex.value],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: c.selectedIndex.value,
          onTap: c.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Histori',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}