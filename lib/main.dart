import 'package:blood/controller/login_controller.dart';
import 'package:blood/controller/sign_up_controller.dart';
import 'package:blood/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const BloodApp());
}

class BloodApp extends StatelessWidget {
  const BloodApp({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return GetMaterialApp(
      title: 'Blood Donor App',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      theme: ThemeData(
        primaryColor: Colors.red.shade900,
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(w, 50),
            backgroundColor: Colors.red.shade900,
            foregroundColor: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Adjust the value as needed
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,),
          backgroundColor: Colors.red.shade900,
          foregroundColor: Colors.white,
          elevation: 5,
        ),
         listTileTheme: ListTileThemeData(
           shape: RoundedRectangleBorder(
             side: BorderSide(width: 2,color: Colors.red.shade200),
             borderRadius: BorderRadius.circular(20),
           ),
           tileColor: Colors.white70,
         ),
        cardTheme: CardTheme(
          //elevation: 0.5,
          //shadowColor: Colors.red.shade700,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.red.shade100)
          ),
        ),
      ),
      initialBinding: ControllerBinder(),
    );
  }
}

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(SignUpController());
  }
}
