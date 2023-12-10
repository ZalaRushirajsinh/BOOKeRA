import 'package:figma/login_page.dart';
import 'package:figma/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'dashboard_page.dart';
import 'otp_screen.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController =
      TextEditingController(); // Change email to mobile
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // Simulate signup process for demonstration
      // Replace this with your actual signup logic
      await Future.delayed(Duration(seconds: 2));

      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      backgroundColor: Color.fromARGB(185, 230, 132, 132),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30.0),
                  // Lottie animation representing an icon reading a book
                  Container(
                    height: 100.0,
                    width: 100.0,
                    child: Lottie.asset(
                      'assets/signup.json', // Replace with your reading icon animation file
                      repeat: true,
                      reverse: false,
                      animate: true,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Your Name',
                      suffixIcon: Icon(Icons.person),
                      labelStyle: TextStyle(
                        color: Colors.yellow,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                      errorStyle: TextStyle(
                        color: Color.fromARGB(255, 177, 8, 8),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller:
                        controller.phoneNo, // Change to mobile controller
                    keyboardType:
                        TextInputType.phone, // Set keyboard type to phone
                    decoration: InputDecoration(
                      labelText: 'Your Mobile Number', // Change label
                      suffixIcon: Icon(Icons.phone),
                      labelStyle: TextStyle(
                        color: Colors.yellow,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                      errorStyle: TextStyle(
                        color: Color.fromARGB(255, 177, 8, 8),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Mobile number is required';
                      } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                        return 'Enter a valid 10-digit mobile number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.lock_outline_rounded),
                      labelStyle: TextStyle(
                        color: Colors.yellow,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                      errorStyle: TextStyle(
                        color: Color.fromARGB(255, 177, 8, 8),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () {
                      SignUpController.instance
                          .phoneAuthentication(controller.phoneNo.text.trim());
                      Get.to(() => OTPScreen());
                    },
                    child: Text('Sign Up'),
                  ),
                  SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () {
                      SignUpController.instance
                          .phoneAuthentication(controller.phoneNo.text.trim());
                      Get.to(() => LoginPage());
                    },
                    child: Text('Already have an account? Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
