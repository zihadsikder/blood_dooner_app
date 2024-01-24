import 'package:blood/presentation/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'alert_cancel_button.dart';

class LogoutAlert extends StatelessWidget {
  const LogoutAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Text("Ready to Leave?", style: TextStyle(fontSize: 16)),
          const Spacer(),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.highlight_remove_outlined))
        ],
      ),
      content: const Text('Select "Logout" below if you are ready to end your current session.'),
      actions: [
        const AlertCancelButton(),
        TextButton(onPressed: (){
          Get.to(const LoginScreen());
        },
          style: TextButton.styleFrom(
              backgroundColor: Colors.red.shade800
          ),
          child: const Text('Logout', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

