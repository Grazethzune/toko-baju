import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modul1_codelab/app/modules/home/views/second.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () => Get.to(SecondPage()),
                child: const Text("Get.to"),
              ),
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () => Get.toNamed('third'),
                child: const Text("Get.toNamed"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
