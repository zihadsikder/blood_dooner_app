import 'package:blood/screens/setting_screen.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Events ',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const SettingsScreen()));
          },
        ),
      ),
      body: Container(
        child: Center(
          child: Text("upcoming events"),
        ),
      ),
    );
  }
}
