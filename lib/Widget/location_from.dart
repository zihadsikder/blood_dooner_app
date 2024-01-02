import 'package:blood/controller/location_controller.dart';
import 'package:blood/model/address_response/District_responce.dart';
import 'package:blood/model/address_response/division_response.dart';
import 'package:blood/model/address_response/union_response.dart';
import 'package:blood/model/address_response/upzila_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationForm extends StatefulWidget {

  final List<String> bloodGroups = [
    '',
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
  //final List<String> divisions = ['Select Division'];
  // final List<String> district = [''];
  // final List<String> upzila = [''];
  final List<String> union = [''];

  String selectedBloodGroup = '';
  String selectedDivision = '';
  String selectedDistrict = '';
  String selectedUpzila = '';
  String selectedUnion = '';


  LocationForm({
    super.key,
    required this.selectedBloodGroup,
    required this.selectedDivision,
    required this.selectedDistrict,
    required this.selectedUpzila,
    required this.selectedUnion,
  });

  @override
  _LocationFormState createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {
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
            print("=========== updated districts ${locationController.districtList?.data?.length}");
            return DropdownButtonFormField<String>(
              value: locationController.selectedDivisionName,
              onChanged: (newValue) {
                  locationController.selectedDivisionName = newValue;
                  locationController.getDistrict(id: newValue!);
                  locationController.update();
              },
              items: locationController.divisionList?.data?.map<DropdownMenuItem<String>>((Datum value) {
                return DropdownMenuItem<String>(
                  value: value.divisionId,
                  child: Text(value.name),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Select Division',
              ),
              validator: (String? value) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Select your Division';
                }
                return null;
              },
            );
          }
        ),
        const SizedBox(height: 8.0),
        GetBuilder<LocationController>(
          builder: (locationController) {
            print("ui updated ${locationController.districtList?.data?.length}");
            return DropdownButtonFormField<String>(
              value: locationController.selectedDistrictName,
              onChanged: (newValue) {
                locationController.selectedDistrictName = newValue!;
                locationController.getUpzila(id: newValue!);
                locationController.update();
              },
              items: locationController.districtList?.data?.map<DropdownMenuItem<String>>((DistrictDatum value) {
                return DropdownMenuItem<String>(
                  value: value.districtId,
                  child: Text(value.name!),
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
            );
          }
        ),
        const SizedBox(height: 8.0),
        GetBuilder<LocationController>(
            builder: (locationController) {
              //print("ui updated ${locationController.districtList?.data?.length}");
              return DropdownButtonFormField<String>(
                value: locationController.selectedUpzilaName,
                onChanged: (newValue) {
                  locationController.selectedUpzilaName = newValue!;
                  //locationController.getUnion(id: newValue!);
                  //locationController.update();
                },
                items: locationController.upzilaList?.data?.map<DropdownMenuItem<String>>((UpzilaDatum value) {
                  return DropdownMenuItem<String>(
                    value: value.upzilaId,
                    child: Text(value.name!),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Select Upzila',
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Select your Upzila';
                  }
                  return null;
                },
              );
            }
        ),
        // DropdownButtonFormField<String>(
        //   value: widget.selectedUpzila,
        //   onChanged: (newValue) {
        //     setState(() {
        //       widget.selectedUpzila = newValue!;
        //     });
        //   },
        //   items: widget.upzila.map<DropdownMenuItem<String>>((String value) {
        //     return DropdownMenuItem<String>(
        //       value: value,
        //       child: Text(value),
        //     );
        //   }).toList(),
        //   decoration: const InputDecoration(
        //     labelText: 'Select Upazila',
        //   ),
        //   validator: (String? value) {
        //     if (value?.trim().isEmpty ?? true) {
        //       return 'Select your Upazila';
        //     }
        //     return null;
        //   },
        // ),
        const SizedBox(height: 16.0),
        // GetBuilder<LocationController>(
        //     builder: (locationController) {
        //       //print("ui updated ${locationController.districtList?.data?.length}");
        //       return DropdownButtonFormField<String>(
        //         value: locationController.selectedUnionName,
        //         onChanged: (newValue) {
        //           locationController.selectedUnionName = newValue!;
        //           locationController.update();
        //         },
        //         items: locationController.unionList?.data?.map<DropdownMenuItem<String>>((UnionDatum value) {
        //           return DropdownMenuItem<String>(
        //             value: value.unionId,
        //             child: Text(value.name!),
        //           );
        //         }).toList(),
        //         decoration: const InputDecoration(
        //           labelText: 'Select Union',
        //         ),
        //         validator: (String? value) {
        //           if (value?.trim().isEmpty ?? true) {
        //             return 'Select your Union';
        //           }
        //           return null;
        //         },
        //       );
        //     }
        // ),
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
