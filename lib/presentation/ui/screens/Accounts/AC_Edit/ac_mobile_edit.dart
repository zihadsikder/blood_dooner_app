import 'package:flutter/material.dart';
class AcMobile extends StatefulWidget {
  const AcMobile({super.key});

  @override
  State<AcMobile> createState() => _AcMobileState();
}

class _AcMobileState extends State<AcMobile> {
  final TextEditingController _mobileTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Text("Edit Your Number", style: TextStyle(fontSize: 16)),
          const Spacer(),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.highlight_remove_outlined))
        ],
      ),

      content:TextFormField(
        controller: _mobileTEController,
        decoration: const InputDecoration(
          hintText: ('value'),
        ),
      ),
      actions:[
        TextButton(onPressed: (){
          Navigator.pop(context);
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey.shade400
        ), child: const Text('Cancel'),),
        TextButton(onPressed: (){},
          style: TextButton.styleFrom(
              backgroundColor: Colors.red.shade800
          ),
            child: const Text('Save'),
        ),
      ],
    );
  }
}
