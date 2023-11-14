import 'package:blood/Widget/location_from.dart';
import 'package:flutter/material.dart';

class AcName extends StatefulWidget {
  const AcName({super.key});

  @override
  State<AcName> createState() => _AcNameState();
}

class _AcNameState extends State<AcName> {
  String selectedBloodGroup = 'A+';
  String selectedDivision = 'Select Division';
  String selectedDistrict = ' ';
  String selectedThana ='';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit Profile"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Type Your Name',
            ),
          ),
          //SizedBox(height: 8.0),
          Location(
          selectedBloodGroup: selectedBloodGroup,
          selectedDivision: selectedDivision,
          selectedDistrict: selectedDistrict,
            selectedThana: selectedThana,
          ),
        ],
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
          onPressed: () {},
          child: Text(
            'Save',
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
