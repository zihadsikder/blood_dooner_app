import 'package:flutter/material.dart';
class AcEmail extends StatefulWidget {
  const AcEmail({super.key});

  @override
  State<AcEmail> createState() => _AcEmailState();
}

class _AcEmailState extends State<AcEmail> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Email Address"),
      content:TextFormField(
        decoration: const InputDecoration(
          hintText: 'Type Your Email',
        ),
      ),
      actions:[
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Cancel',style: TextStyle(
          color: Colors.red.shade400,
          fontWeight: FontWeight.bold,
        ),)),
        TextButton(onPressed: (){},
            child: Text('Save',style: TextStyle(
              color: Colors.red.shade400,
              fontWeight: FontWeight.bold,
            ),)),
      ],
    );
  }
}
