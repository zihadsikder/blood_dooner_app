import 'package:blood/screens/account_screen.dart';
import 'package:blood/screens/dashboard_screen.dart';
import 'package:blood/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'setting_screen.dart';


class Mainpage extends StatefulWidget {
  const Mainpage({Key? key});
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List pages = [
    Home_Screen(),
    Dashboard_Screen(),
    AccountScreen(),
    SettingsScreen(),
  ];
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
      // appBar: AppBar(
      //   title: Text("Search a Blood Donar"),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.search),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => Search()), // Use the correct search page
      //         );
      //       },
      //     ),
      //   ],
      //   elevation: 10,
      // ),
      body: pages [currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.red.shade900,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade500,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
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
