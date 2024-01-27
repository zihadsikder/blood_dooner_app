import 'package:blood/presentation/ui/Widget/location_from.dart';
import 'package:flutter/material.dart';

class AcName extends StatefulWidget {
  const AcName({super.key});

  @override
  State<AcName> createState() => _AcNameState();
}

class _AcNameState extends State<AcName> {

  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();

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
                hintText: 'Mobile',
              ),
            ),
            const SizedBox(height: 4.0),
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
            TextFormField(
              controller: _mobileTEController,
              decoration: const InputDecoration(
                hintText: ('Name'),
              ),
            ),
            const SizedBox(height: 1),
            TextFormField(
              controller: _emailTEController,
              decoration: const InputDecoration(
                hintText: ('Email'),
              ),
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
