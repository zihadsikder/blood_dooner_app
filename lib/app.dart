import 'package:blood/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/location_controller.dart';
import 'controller/login_controller.dart';
import 'controller/sign_up_controller.dart';
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

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(SignUpController());
    Get.lazyPut<LocationControler>(() => LocationControler());
  }
}
