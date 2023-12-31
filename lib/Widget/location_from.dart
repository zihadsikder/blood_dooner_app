import 'package:blood/controller/location_controller.dart';
import 'package:blood/model/address_response/division_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final List<String> divisions = [''];

  final List<String> district = [''];
  final List<String> upzila = [''];
  final List<String> union = [''];

  String selectedDivision = '';
  String selectedDistrict = '';
  String selectedUpzila = '';
  String selectedUnion = '';

  Location({
    super.key,
    required this.selectedBloodGroup,
    required this.selectedDivision,
    required this.selectedDistrict,
    required this.selectedUpzila,
    required this.selectedUnion,
  });

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final LocationController locationController = Get.find<LocationController>();
  @override
  void initState() {
    super.initState();
    locationController.getDivision();
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
          items: widget.bloodGroups.map<DropdownMenuItem<String>>((String value) {
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
              return 'Enter your blood group';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
        GetBuilder<LocationController>(
          builder: (locationController) {
            if (locationController.divisionList.isNotEmpty) {
              return DropdownButtonFormField<Datum>(
                value: locationController.divisionList[locationController.selectedDivision.value],
                onChanged: (newValue) {
                  locationController.selectedDivision.value =
                      int.tryParse(newValue!.divisionId) ?? 0;
                  //widget.onDivisionChanged(newValue!);
                },
                items: locationController.divisionList
                    .map<DropdownMenuItem<Datum>>((Datum value) {
                  return DropdownMenuItem<Datum>(
                    value: value, // Use the Datum object itself as the value
                    child: Text(value.name),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Select Division',
                ),
                validator: (Datum? value) {
                  if (locationController.selectedDivision == 0) {
                    return 'Select your division';
                  }
                  return null;
                },
              );
            } else {
              return SizedBox();
            }
          },
        ),
        const SizedBox(height: 8.0),
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
        const SizedBox(height: 8.0),
        DropdownButtonFormField<String>(
          value: widget.selectedUpzila,
          onChanged: (newValue) {
            setState(() {
              widget.selectedUpzila = newValue!;
            });
          },
          items: widget.upzila.map<DropdownMenuItem<String>>((String value) {
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
        DropdownButtonFormField<String>(
          value: widget.selectedUnion,
          onChanged: (newValue) {
            setState(() {
              widget.selectedUnion = newValue!;
            });
          },
          items: widget.union.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Select Union',
          ),
          validator: (String? value) {
            if (value?.trim().isEmpty ?? true) {
              return 'Select your Union';
            }
            return null;
          },
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
