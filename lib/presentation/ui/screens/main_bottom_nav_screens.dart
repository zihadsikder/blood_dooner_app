import 'package:flutter/material.dart';
import 'Accounts/account_screen.dart';
import 'dashboard_screen.dart';
import 'home_screen.dart';
import 'sittings/setting_screen.dart';
class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});
  @override
  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}
class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  List pages = const [
    HomeScreen(),
    DashboardScreen(),
    AccountScreen(),
    SettingsScreen(),
  ];

  // List pages = [
  //    const HomeScreen(),
  //    const DashboardScreen(),
  //    const AccountScreen(),
  //    const SettingsScreen(),
  // ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages [currentIndex] ,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          // unselectedFontSize: 0,
          // selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.red.shade900,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade500,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(label: ("Home"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: ("Dashboard"), icon: Icon(Icons.dashboard_outlined)),
            BottomNavigationBarItem(label: ("Account"), icon: Icon(Icons.person)),
            BottomNavigationBarItem(label: ("Settings"), icon: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
