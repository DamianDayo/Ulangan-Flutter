import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/database_helper.dart';
import 'package:ulangan_flutter/routes/pages.dart';
import 'package:ulangan_flutter/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dbHelper = DatabaseHelper.instance;
  final user = await dbHelper.getUser();
  final isLoggedIn = user != null && user['isLoggedIn'] == 1;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ulangan Flutter",
      initialRoute: isLoggedIn
          ? AppRoutes
                .splashscreenPage 
          : AppRoutes.loginPage,
      getPages: AppPages.pages,
    );
  }
}