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

  // Future<void> goToLogin() async {
  //   final bool isLogin = await Get.find<AuthController>().checkAuthState();
  //
  //   Future.delayed(const Duration(seconds: 2)).then((value) {
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => isLogin
  //                 ? const MainBottomNavScreen()
  //                 : const LoginScreen()),
  //             (route) => false);
  //   });
  // }
  void goToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
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
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     checkAuthState();
//   }
//
//   Future<void> checkAuthState() async {
//     final bool isLogin = await Get.find<AuthController>().checkAuthState();
//     await Future.delayed(const Duration(seconds: 2));
//     if (isLogin) {
//       Get.offAll(() => const MainBottomNavScreen());
//     } else {
//       Get.offAll(() => const LoginScreen());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Spacer(),
//             AppLogo(),
//             Spacer(),
//             CircularProgressIndicator(),
//             SizedBox(height: 8.0),
//             Text('Version 1.0'),
//             SizedBox(height: 8.0),
//           ],
//         ),
//       ),
//     );
//   }
// }
