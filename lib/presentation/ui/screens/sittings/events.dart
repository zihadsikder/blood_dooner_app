import 'package:blood/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:blood/presentation/ui/screens/sittings/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Events ',
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.to(const SettingsScreen());
            },
          ),
        ),
        body: Container(
          child: Center(
            child: Text("upcoming events"),
          ),
        ),
      ),
    );
  }
}
