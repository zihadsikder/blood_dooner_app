// import 'package:blood/presentation/ui/screens/Auth%20Screens/login_screen.dart';
// import 'package:blood/presentation/ui/screens/splash_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'controller_binder.dart';
// import 'data/utility/app_theme_data.dart';
//
// class BloodApp extends StatelessWidget {
//   const BloodApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return GetMaterialApp(
//       title: 'Blood Donor App',
//       themeMode: ThemeMode.system,
//       debugShowCheckedModeBanner: false,
//       home: const SplashScreen(),
//       //home: const LoginScreen(),
//       theme: AppThemeData.lightThemeData,
//       initialBinding: ControllerBinder(),
//     );
//   }
// }
//
import 'package:blood/presentation/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller_binder.dart';
import 'data/utility/app_theme_data.dart';

import 'nertwork_connection_alert.dart';

class BloodApp extends StatelessWidget {
  const BloodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blood Donor App',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          return const Stack(
            children: [
              SplashScreen(),
              //ConnectionAlert(),
            ]);
        },
      ),
      theme: AppThemeData.lightThemeData,
      initialBinding: ControllerBinder(),
    );
  }
}
