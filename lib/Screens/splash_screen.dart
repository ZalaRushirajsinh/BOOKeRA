// splash_screen.dart
import 'package:figma/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_page.dart';
import 'login_page.dart';

class SplashScreen extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<String> _imagePaths = [
    'assets/abc.jpg',
    'assets/123.jpg',
    'assets/456.jpg',
    'assets/789.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 450,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _imagePaths.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    _imagePaths[index],
                    width: 450,
                    height: 450,
                  );
                },
                onPageChanged: (index) {},
              ),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                    text: 'WELCOME TO ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'BOOKeRA',
                    style: TextStyle(
                      color: Colors.amberAccent[400],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Reading Re-imagined Anytime, Anywhere',
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Use named route to navigate to SignUpPage without rebuilding the SplashScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 244, 194, 42),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Get.to(SignUpPage());
                // Use named route to navigate to SignUpPage without rebuilding the SplashScreen
                //Navigator.pushNamed(context, '/signup');
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
