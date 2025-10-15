import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulangan_flutter/routes/pages.dart';
import 'package:ulangan_flutter/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final username = prefs.getString("username");
  final isLoggedIn = username != null;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ulangan Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute:
          isLoggedIn ? AppRoutes.splashscreenPage : AppRoutes.loginPage,
      getPages: AppPages.pages,
    );
  }
}