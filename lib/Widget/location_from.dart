import 'package:blood/controller/location_controller.dart';
import 'package:blood/model/division_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/sign_up_controller.dart';

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

  final List<String> divisions = ['.....'];

  final List<String> district = ['', 'Coxs Bazar', 'Chittagong'];
  final List<String> Thana = ['', 'Kutubdia'];

  String selectedDivision = 'Select Division';
  String selectedDistrict = 'Select District';
  String selectedThana = 'Select Thana';

  Location({
    super.key,
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
  void initState() {
    super.initState();

    Get.find<LocationControler>().getDivision();
  }

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
        GetBuilder<LocationControler>(
          builder: (LocationControler controller) {
           if(controller.divisionList.isNotEmpty) {
              return DropdownButtonFormField<Datum>(
                value:
                    controller.divisionList[controller.selectedDivision.value],
                onChanged: (newValue) {
                  controller.selectedDivision.value =
                      int.tryParse(newValue!.divisionId) ?? 0;
                  //widget.onDivisionChanged(newValue!);
                },
                items: controller.divisionList
                    .map<DropdownMenuItem<Datum>>((Datum value) {
                  return DropdownMenuItem<Datum>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Select Division',
                ),
                validator: (Datum? value) {
                  if (controller.selectedDivision == 0) {
                    return 'Select your division';
                  }
                  return null;
                },
              );
            }
           else{
             return SizedBox();
           }
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
          items: widget.district.map<DropdownMenuItem<String>>((String value) {
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
              return 'Select your District';
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
          items: widget.Thana.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Select Upazila',
          ),
          validator: (String? value) {
            if (value?.trim().isEmpty ?? true) {
              return 'Select your Upazila';
            }
            return null;
          },
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
