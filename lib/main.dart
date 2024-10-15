import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_1/app/page/landing_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        // root
        GetPage(
          name: "/",
          page: () => LandingPage(),
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
