import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/splashscreen_controller.dart';

class SplashscreenMobilePage extends StatelessWidget {
  SplashscreenMobilePage({super.key});

  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 200, 200),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(color: Colors.blue, size: 50.0),
            SizedBox(height: 15),
            Text(
              "Loading...",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
