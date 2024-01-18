import 'package:flutter/material.dart';
class AcMobile extends StatefulWidget {
  const AcMobile({super.key});

  @override
  State<AcMobile> createState() => _AcMobileState();
}

class _AcMobileState extends State<AcMobile> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Your Number"),
      content:TextFormField(
        decoration: const InputDecoration(
          hintText: 'Enter Your Number',
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
