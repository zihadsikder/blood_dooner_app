import 'package:blood/data/model/address_response/District_responce.dart';
import 'package:blood/data/model/address_response/division_response.dart';
import 'package:blood/data/model/address_response/union_response.dart';
import 'package:blood/data/model/address_response/upzila_response.dart';
import 'package:blood/data/model/registration_params.dart';
import 'package:blood/presentation/state_holders/controller/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationFormScreen extends StatefulWidget {
  final List<String> bloodGroups = [
    ' ',
    'A+',
    'A-',
    'AB+',
    'AB-',
    'B-',
    'B+',
    'O+',
    'O-'
  ];

  final String selectedBloodGroup;
  final String selectedDivision;
  final String selectedDistrict;
  final String selectedUpzila;
  final String selectedUnion;
  final Function(String)? onBloodGroupSelected;

  LocationFormScreen({
    super.key,
    required this.selectedBloodGroup,
    required this.selectedDivision,
    required this.selectedDistrict,
    required this.selectedUpzila,
    required this.selectedUnion,
    required this.onBloodGroupSelected,
  });

  Address getSelectedAddress() {
    return Address(
      divisionId: selectedDivision,
      districtId: selectedDistrict,
      areaId: selectedUpzila,
      postOffice: selectedUnion,
    );
  }

  @override
  State<LocationFormScreen> createState() => _LocationFormScreenState();
}

class _LocationFormScreenState extends State<LocationFormScreen> {
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
        bloodDropdownButtonFormField,
        const SizedBox(height: 4.0),

        GetBuilder<LocationController>(builder: (locationController) {
          return DropdownButtonFormField<String>(
            value: locationController.selectedDivisionName,
            onChanged: (newValue) {
              locationController.selectedDivisionName = newValue ?? '';
              locationController.getDistrict(id: newValue!);
              locationController.update();
            },
            items: locationController.divisionList
                ?.map<DropdownMenuItem<String>>((Division value) {
              return DropdownMenuItem<String>(
                value: value.divisionId,
                // Assuming divisionId is the unique identifier
                child: Text(value.name),
              );
            }).toList(),
            decoration: const InputDecoration(
              labelText: 'Select Division',
            ),
          );
        }),
        const SizedBox(height: 4.0),

        GetBuilder<LocationController>(builder: (locationController) {
          return DropdownButtonFormField<String>(
            value: locationController.selectedDistrictName,
            onChanged: (newValue) {
              locationController.selectedDistrictName = newValue ?? '';
              locationController.getUpzila(id: newValue!);
              //locationController.update();
              //print("ui updated DISTRICT ${locationController.districtList?.length}");
            },
            items: locationController.districtList
                ?.map<DropdownMenuItem<String>>((District value) {
              return DropdownMenuItem<String>(
                value: value.districtId,
                child: Text(value.name!),
              );
            }).toList(),
            decoration: const InputDecoration(
              labelText: 'Select District',
            ),
          );
        }),
        const SizedBox(height: 4.0),

        GetBuilder<LocationController>(builder: (locationController) {
          return DropdownButtonFormField<String>(
            value: locationController.selectedUpzilaName,
            onChanged: (newValue) {
              locationController.selectedUpzilaName = newValue ?? '';
              //print("ui updated from upzila ::: ${locationController.upzilaList}");
              locationController.getUnion(id: newValue!);
            },
            items: locationController.upzilaList
                ?.map<DropdownMenuItem<String>>((Upzila value) {
              return DropdownMenuItem<String>(
                value: value.upzilaId,
                child: Text(value.name!),
              );
            }).toList(),
            decoration: const InputDecoration(
              labelText: 'Select Upzila',
            ),
          );
        }),
        const SizedBox(height: 4.0),

        GetBuilder<LocationController>(builder: (locationController) {
          return DropdownButtonFormField<String>(
            value: locationController.selectedUnionName,
            onChanged: (newValue) {
              locationController.selectedUnionName = newValue!;
              //print("ui updated from upzila ::: ${locationController.upzilaList}");
            },
            items: locationController.unionList
                ?.map<DropdownMenuItem<String>>((Union value) {
              return DropdownMenuItem<String>(
                value: value.unionId,
                child: Text(value.name!),
              );
            }).toList(),
            decoration: const InputDecoration(
              labelText: 'Select Union',
            ),
          );
        }),
        const SizedBox(height: 4.0),
      ],
    );
  }

  DropdownButtonFormField<String> get bloodDropdownButtonFormField {
    return DropdownButtonFormField<String>(
        value: widget.selectedBloodGroup,
        onChanged: (newValue) {
          setState(() {
            widget.onBloodGroupSelected!(newValue!);
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
            labelText: 'Blood Group', labelStyle: TextStyle(fontSize: 18)),
      );
  }
}
