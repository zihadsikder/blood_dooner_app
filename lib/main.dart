import 'package:blood/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'My First App',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Login(),
      theme: ThemeData(
        primaryColor: Colors.red,
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
      )
    );
  }
}
