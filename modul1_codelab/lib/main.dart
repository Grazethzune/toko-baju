import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modul1_codelab/app/modules/home/views/root.dart';
import 'package:modul1_codelab/app/modules/home/views/second.dart';
import 'package:modul1_codelab/app/modules/home/views/third.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        // root
        GetPage(
          name: "/",
          page: () => RootPage(),
        ),
        // other
        GetPage(
          name: "/second",
          page: () => SecondPage(),
        ),
        GetPage(
          name: "/third",
          page: () => ThirdPage(),
        ),
      ],
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      translationsKeys: const {
        'en_US': {
          'welcome': 'Welcome',
          'page_root': 'Root Page',
          'page_login': 'Login Page',
          'page_register': 'Register Page',
          'page_notfound': 'Not Found Page',
        },
      },
      locale: const Locale('en', 'US'),
    ),
  );
}
