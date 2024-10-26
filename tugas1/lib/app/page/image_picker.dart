import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tugas_1/app/modules/home/controllers/home_controller.dart';

class image_picker extends StatelessWidget {
  final HomeController controller =
      Get.put(HomeController()); // Inisialisasi controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment
              .center, // Mengatur agar widget di tengah secara vertikal
          crossAxisAlignment: CrossAxisAlignment
              .center, // Mengatur agar widget di tengah secara horizontal
          children: [
            // Display gambar profil
            Obx(() {
              return controller.selectedImagePath.value == ''
                  ? CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, size: 80, color: Colors.white),
                    )
                  : CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          FileImage(File(controller.selectedImagePath.value)),
                    );
            }),

            SizedBox(height: 20),

            // Tombol untuk mengambil gambar dari kamera
            ElevatedButton.icon(
              onPressed: () {
                controller
                    .getImage(ImageSource.camera); // Memilih gambar dari kamera
              },
              icon: Icon(Icons.camera),
              label: Text("Take Photo"),
            ),

            SizedBox(height: 10),

            // Tombol untuk mengambil gambar dari galeri
            ElevatedButton.icon(
              onPressed: () {
                controller.getImage(
                    ImageSource.gallery); // Memilih gambar dari galeri
              },
              icon: Icon(Icons.photo_library),
              label: Text("Choose from Gallery"),
            ),
          ],
        ),
      ),
    );
  }
}
