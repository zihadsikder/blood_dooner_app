import 'package:flutter/material.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Your Email'),
      content: TextFormField(
        decoration: InputDecoration(hintText: ('Enter Email')),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.red.shade400,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            ///Add forget password logic here
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please Check Your Mail!'),
              ),
            );
          },
          child: Text(
            'Recovery',
            style: TextStyle(
              color: Colors.red.shade400,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
