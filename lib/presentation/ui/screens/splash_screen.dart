import 'package:blood/presentation/state_holders/controller/auth_controller.dart';
import 'package:blood/presentation/ui/Widget/app_logo.dart';
import 'package:blood/presentation/ui/screens/main_bottom_nav_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Auth Screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

  class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  void goToLogin() async {
    await Future.delayed(const Duration(seconds: 1));
    final bool isLoggedIn = await Get.find<AuthController>().isLoggedIn();
    if (isLoggedIn) {
      Get.offAll(() => const MainBottomNavScreen());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            SizedBox(height: 16),
            Text('আমি বাচাঁতে চাই একটি প্রাণ'),
            Text('তাইতো করবো রক্তদান'),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(
              height: 8.0,
            ),
            Text('Version 1.0'),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}

