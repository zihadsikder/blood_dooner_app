import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'A',
    'AB',
    'AB+',
    'AB-',
    'B',
    'B-',
    'B+',
    'O',
    'O+',
    'O-'
  ];
  String selectedBloodGroup = 'A+';

  final List<String> divisions = [
    'Select Division',
    'Dhaka',
    'Chattogram',
    'Rajshahi',
    'Sylhet',
    'Barishal',
    'Mymensingh',
    'Khulna',
    'Rangpur',
  ];

  final List<String> district = ['','Coxs Bazar', 'Chittagong'];
  final List<String> Thana = ['','Kutubdia'];

  String selectedDivision = 'Select Division';
  String selectedDistrict = 'Select District';
  String selectedThana = 'Select Thana';

  Location({super.key,
    required this.selectedBloodGroup,
    required this.selectedDivision,
    required this.selectedDistrict,
    required this.selectedThana,
  });
  @override
  _LocationState createState() => _LocationState();
}
class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: widget.selectedBloodGroup,
          onChanged: (newValue) {
            setState(() {
              widget.selectedBloodGroup = newValue!;
            });
          },
          items:
              widget.bloodGroups.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Blood Group',
          ),
          validator: (String? value) {
            if (value?.trim().isEmpty ?? true) {
              return 'Enter your password';
            }
            return null;
          },
        ),
        const SizedBox(height: 16.0),
        DropdownButtonFormField<String>(
          value: widget.selectedDivision,
          onChanged: (newValue) {
            setState(() {
              widget.selectedDivision = newValue!;
              //widget.onDivisionChanged(newValue!);
            });
          },
          items: widget.divisions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Select Division',
          ),
          validator: (String? value) {
            if (value?.trim().isEmpty ?? true) {
              return 'Enter your password';
            }
            return null;
          },
        ),
        const SizedBox(height: 16.0),
        DropdownButtonFormField<String>(
          value: widget.selectedDistrict,
          onChanged: (newValue) {
            setState(() {
              widget.selectedDistrict = newValue!;
            });
          },
          items: widget.district
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Select District',
          ),
          validator: (String? value) {
            if (value?.trim().isEmpty ?? true) {
              return 'Enter your password';
            }
            return null;
          },
        ),
        const SizedBox(height: 16.0),
        DropdownButtonFormField<String>(
          value: widget.selectedThana,
          onChanged: (newValue) {
            setState(() {
              widget.selectedThana = newValue!;
            });
          },
          items: widget.Thana
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Select Thana/ Upazila',
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
