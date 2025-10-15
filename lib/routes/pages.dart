import 'package:get/get.dart';
import 'package:ulangan_flutter/pages/login/login_page.dart';
import 'package:ulangan_flutter/pages/main_menu_page.dart';
import 'package:ulangan_flutter/pages/home/home_page.dart';
import 'package:ulangan_flutter/pages/history/history_page.dart';
import 'package:ulangan_flutter/pages/profile/profile_page.dart';
import 'package:ulangan_flutter/pages/add_todo/add_todo_page.dart';
import 'package:ulangan_flutter/pages/edit_todo/edit_todo_page.dart';
import 'package:ulangan_flutter/pages/splashscreen/splashscreen_page.dart';

import 'package:ulangan_flutter/bindings/login_binding.dart';
import 'package:ulangan_flutter/bindings/main_menu_binding.dart';
import 'package:ulangan_flutter/bindings/home_binding.dart';
import 'package:ulangan_flutter/bindings/history_binding.dart';
import 'package:ulangan_flutter/bindings/profile_binding.dart';
import 'package:ulangan_flutter/bindings/add_todo_binding.dart';
import 'package:ulangan_flutter/bindings/edit_todo_binding.dart';
import 'package:ulangan_flutter/bindings/splash_binding.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.mainMenuPage, page: () => MainMenuPage(), binding: MainMenuBinding()),
    GetPage(name: AppRoutes.homePage, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: AppRoutes.historyPage, page: () => HistoryPage(), binding: HistoryBinding()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage(), binding: ProfileBinding()),
    GetPage(name: AppRoutes.addTodoPage, page: () => AddTodoPage(), binding: AddTodoBinding()),
    GetPage(name: AppRoutes.editTodoPage, page: () => EditTodoPage(), binding: EditTodoBinding()),
    GetPage(name: AppRoutes.splashscreenPage, page: () => SplashscreenPage(), binding: SplashBinding()),
  ];
}