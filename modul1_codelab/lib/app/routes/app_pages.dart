import 'package:get/get.dart';
import 'package:modul1_codelab/coba.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const Main(),
      binding: HomeBinding(),
    ),
  ];
}
