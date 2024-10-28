import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_1/app/modules/home/controllers/home_controller.dart';
import 'package:tugas_1/app/page/image_picker.dart';
import 'package:tugas_1/app/page/detail_product.dart';
import 'package:tugas_1/app/page/third.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: _buildSearchBar(),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.grey),
            onPressed: () {},
          ),
          InkWell(
            onTap: () => Get.to(ImagePickerPage()),
            child: Obx(
              () => controller.selectedImagePath.value == ''
                  ? CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, color: Colors.white),
                    )
                  : CircleAvatar(
                      backgroundImage:
                          FileImage(File(controller.selectedImagePath.value)),
                    ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHotDealBanner(),
            _buildFlashSaleSection(),
            _buildTopSellerSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search Product',
        prefixIcon: Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildHotDealBanner() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/Frame 14.png',
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }

  Widget _buildFlashSaleSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Flash Sale',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Obx(() => Text(controller.flashSaleTime.value)),
          SizedBox(height: 10),
          _buildAutoScrollingProductList(),
        ],
      ),
    );
  }

  Widget _buildHorizontalProductList() {
    return Obx(() => Container(
          height: 250, // Set height for the horizontal list
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              var product = controller.products[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: _buildHorizontalProductCard(product),
              );
            },
          ),
        ));
  }

  Widget _buildAutoScrollingProductList() {
    return Obx(() => Container(
          height: 250, // Set height for the horizontal list
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              var product = controller.products[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _buildHorizontalProductCard(product),
              );
            },
          ),
        ));
  }

  Widget _buildHorizontalProductCard(Map<String, String> product) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProductPage and pass product details
        Get.to(ProductPage(
          isEdit: false,
          name: product['name']!,
          price: product['price']!,
          discount: product['discount']!,
          originalPrice: product['originalPrice']!,
          location: product['location']!,
          index_color: product['index_color']!,
          index_size: product['index_size']!,
          image_path: product['image']!,
        ));
      },
      child: Container(
        width: 160, // Set width for each product card
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 209, 209, 209),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 203, 37, 37).withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                product['image']!,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product['name']!, style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Rp. ${product['price']!}',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    'Rp. ${product['originalPrice']!}',
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${product['discount']!} %',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product['location']!,
                  style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return Obx(() => GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            var product = controller.products[index];
            return GestureDetector(
              onTap: () {
                Get.to(ProductPage(
                  isEdit: false,
                  name: product['name']!,
                  price: product['price']!,
                  discount: product['discount']!,
                  originalPrice: product['originalPrice']!,
                  location: product['location']!,
                  index_color: product['index_color']!,
                  index_size: product['index_size']!,
                  image_path: product['image']!,
                ));
              },
              child: _buildHorizontalProductCard(product),
            );
          },
        ));
  }

  Widget _buildTopSellerSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Seller',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () => Get.to(ProductListLainnyaScreen()),
                  icon: Icon(Icons.arrow_right_alt, color: Colors.black)),
            ],
          ),
          SizedBox(height: 10),
          _buildHorizontalProductList(),
        ],
      ),
    );
  }
}
