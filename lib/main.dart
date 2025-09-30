import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/routes/pages.dart';
import 'package:ulangan_flutter/routes/routes.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ulangan Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.loginPage,
      getPages: AppPages.pages,
    );
  }
}
