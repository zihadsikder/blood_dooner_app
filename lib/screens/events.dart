import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.red.shade900,
      ),
      body: Container(
        child: Center(
          child: Text("upcoming events"),
        ),
      ),
    );
  }
}
