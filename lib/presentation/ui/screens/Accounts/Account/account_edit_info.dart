import 'package:blood/presentation/ui/Widget/alert_cancel_button.dart';
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
            Container(height: 1, color: Colors.grey.shade100),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            Container(height: 1, color: Colors.grey.shade100),
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
            Container(height: 1, color: Colors.grey.shade100),
            TextFormField(
              controller: _mobileTEController,
              decoration: const InputDecoration(
                hintText: ('Mobile'),
              ),
            ),
            Container(height: 1, color: Colors.grey.shade100),
            TextFormField(
              controller: _emailTEController,
              decoration: const InputDecoration(
                hintText: ('Email'),
              ),
            ),
            Container(height: 1, color: Colors.grey.shade100),
          ],
        ),
      ),
      actions: [
        const AlertCancelButton(),
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
