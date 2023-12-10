import 'package:figma/authentication.dart';
import 'package:figma/dashboard_page.dart';
import 'package:figma/firebase_options.dart';
import 'package:figma/login_page.dart';
import 'package:figma/otp_controller.dart';
import 'package:figma/otp_screen.dart';
import 'package:figma/profile_page.dart';
import 'package:figma/signup_page.dart';
import 'package:figma/splash_screen.dart';
import 'package:figma/terms_and_condition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
  Get.put(OTPController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/signup': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/profile': (context) => ProfilePage(),
        '/terms_and_conditions': (context) => TermsAndConditionsPage(),
        '/otp': (context) => OTPScreen(),
        // Add this line
      },
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      //transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
