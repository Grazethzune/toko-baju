import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/home/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/logo.png',
                height: 100,
              ),
              const SizedBox(height: 10),

              const Text(
                'See more from naimike.co',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              _buildTextField(
                hintText: 'Mobile Number or Email',
                controller: controller.emailController,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                hintText: 'Password',
                controller: controller.passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                hintText: 'Full Name',
                controller: controller.fullNameController,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                hintText: 'Username',
                controller: controller.usernameController,
              ),
              const SizedBox(height: 20),

              const Text(
                'By signing up, you agree to our Terms & Privacy Policy',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: controller.register,
                child: const Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  minimumSize:
                      const Size(double.infinity, 50), // Button full width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create text fields
  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
