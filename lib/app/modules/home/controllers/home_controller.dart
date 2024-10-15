import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final tabIndex = 0.obs;
  var index = 0.obs;
  Timer? timer;
  late PageController pageController;
  int currentPage = 0;

  var selectedImagePath = "".obs;
  var selectedImageSize = "".obs;

  var flashSaleTime = '02:08:10'.obs;
  var products = [
    {
      'name': 'Teripang Belitung',
      'price': 'Rp 50.000',
      'discount': '50%',
      'originalPrice': 'Rp 100.000',
      'location': 'Jakarta',
      'image': 'assets/images/Frame 2.png' // Example image
    },
    {
      'name': 'Sepatu Puma',
      'price': 'Rp 300.000',
      'discount': '10%',
      'originalPrice': 'Rp 330.000',
      'location': 'Jakarta',
      'image': 'assets/images/Frame 2.png' // Example image
    },
    {
      'name': 'Sepatu Adidas',
      'price': 'Rp 500.000',
      'discount': '10%',
      'originalPrice': 'Rp 400.000',
      'location': 'Jakarta',
      'image': 'assets/images/Frame 2.png' // Example image
    }
  ].obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "MB";
    } else {
      Get.snackbar('Error', 'Image Not Selected');
    }
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
        initialPage: 0, viewportFraction: 0.8); // Create PageController
    loadInitialProducts();
    startAutoScroll();
  }

  @override
  void onClose() {
    timer?.cancel(); // Cancel timer when the controller is closed
    pageController.dispose();
    super.onClose();
  }

  void loadInitialProducts() {
    products.addAll([
      {
        'name': 'Teripang Belitung',
        'price': 'Rp 50.000',
        'discount': '50%',
        'originalPrice': 'Rp 100.000',
        'location': 'Jakarta',
        'image': 'assets/images/Frame 2.png'
      },
      {
        'name': 'Sepatu Puma',
        'price': 'Rp 300.000',
        'discount': '10%',
        'originalPrice': 'Rp 330.000',
        'location': 'Jakarta',
        'image': 'assets/images/Frame 2.png'
      }
    ]);
  }

  void startAutoScroll() {
    timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage < products.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void increment() => index.value++;

  @override
  void dispose() {
    super.dispose();
  }
}
