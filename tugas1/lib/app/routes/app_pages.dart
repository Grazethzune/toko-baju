import 'package:get/get.dart';
import 'package:tugas_1/app/page/login.dart';
import 'package:tugas_1/app/page/logout.dart';

import '../modules/home/bindings/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => LoginPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGOUT,
      page: () => LogoutPage(),
    ),
  ];
}
