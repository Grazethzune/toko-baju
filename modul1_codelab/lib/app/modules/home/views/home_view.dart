import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: konten_head(),
      body: konten_body(),
    );
  }

// HASIL REFACTOR
  Center konten_body() {
    return const Center(
      child: Text(
        'HomeView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  AppBar konten_head() {
    return AppBar(
      title: const Text('HomeView'),
      centerTitle: true,
    );
  }
}
