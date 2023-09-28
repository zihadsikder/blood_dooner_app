import 'package:blood/constants/location_from.dart';
import 'package:flutter/material.dart';

class AcName extends StatefulWidget {
  const AcName({super.key});

  @override
  State<AcName> createState() => _AcNameState();
}

class _AcNameState extends State<AcName> {
  String selectedBloodGroup = 'A+';

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
            selectedDivision: 'Select Division',
            selectedDistrict: 'Select District',
            onBloodGroupChanged: (newValue) {
              setState(() {
                selectedBloodGroup = newValue;
              });
            },
            onDivisionChanged: (newValue) {},
            onDistrictChanged: (newValue) {},
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
