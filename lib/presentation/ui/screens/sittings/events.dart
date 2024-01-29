import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.back();
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
              Get.back();
              //Get.to(const MainBottomNavScreen());
            },
          ),
        ),
        body: const Center(
          child: Text("upcoming events"),

        ),
      ),
    );
  }
}
