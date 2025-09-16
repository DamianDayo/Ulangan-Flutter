import 'package:get/get.dart';
import 'package:ulangan_flutter/pages/history_page.dart';
import 'package:ulangan_flutter/pages/home_page.dart';
import 'package:ulangan_flutter/pages/login_page.dart';
import 'package:ulangan_flutter/pages/profile_page.dart';

class MainMenuBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginPage>(() => LoginPage());
    Get.lazyPut<HomePage>(() => HomePage());
    Get.lazyPut<HistoryPage>(() => HistoryPage());
    Get.lazyPut<ProfilePage>(() => ProfilePage());
  }
}