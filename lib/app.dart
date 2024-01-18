import 'package:blood/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller_binder.dart';
import 'data/utility/app_theme_data.dart';

class BloodApp extends StatelessWidget {
  const BloodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blood Donor App',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      theme: AppThemeData.lightThemeData,
      initialBinding: ControllerBinder(),
    );
  }
}

