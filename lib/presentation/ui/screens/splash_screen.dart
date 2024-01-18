import 'package:blood/presentation/state_holders/controller/auth_controller.dart';
import 'package:blood/presentation/ui/Widget/app_logo.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';

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
        // body: BodyBackground(
        //   child: Center(
        //     child: AppLogo(),
        //
        //   ),
        // )
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 8.0,),
            Text('Version 1.0'),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}