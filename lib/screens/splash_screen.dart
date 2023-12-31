import 'package:blood/Widget/app_logo.dart';
import 'package:blood/screens/home_screen.dart';
import 'package:blood/screens/login.dart';
import 'package:flutter/material.dart';
import '../Widget/body_background.dart';
import '../controller/auth_controller.dart';

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

  Future<void> goToLogin() async {
    final bool isLoggedIn = await AuthController.checkAuthState();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => isLoggedIn
                  ? const HomeScreen()
                  : const LoginScreen()),
              (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: BodyBackground(
          child: Center(
            child: AppLogo(),
          ),
        )
    );
  }
}