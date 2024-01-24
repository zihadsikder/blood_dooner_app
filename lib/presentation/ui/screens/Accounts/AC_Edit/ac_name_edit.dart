import 'package:blood/presentation/ui/Widget/location_from.dart';
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
  String selectedUpzila =' ';
  String selectedUnion =' ';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Text("Edit Your Profile", style: TextStyle(fontSize: 16)),
          const Spacer(),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.highlight_remove_outlined))
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Type Your Name',
              ),
            ),
            const SizedBox(height: 8.0),
            LocationFormScreen(
            selectedBloodGroup: selectedBloodGroup,
            selectedDivision: selectedDivision,
            selectedDistrict: selectedDistrict,
              selectedUpzila: selectedUpzila,
              selectedUnion: selectedUnion,
              onBloodGroupSelected: (bloodGroup) {
                setState(() {
                  selectedBloodGroup = bloodGroup;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        },
          style: TextButton.styleFrom(
              backgroundColor: Colors.grey.shade400
          ), child: const Text('Cancel',),),
        TextButton(onPressed: (){},
          style: TextButton.styleFrom(
              backgroundColor: Colors.red.shade800
          ),
          child: const Text('Save', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
