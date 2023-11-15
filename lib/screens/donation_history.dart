import 'package:flutter/material.dart';

class Donation extends StatefulWidget {
  const Donation({super.key});

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To be a hero! Donate Blood'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            ),
            leading: SizedBox(
              width: 32,
              //color: Colors.grey,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/bloodicon.png',
                  height: 36,
                  width: 24,
                ),
              ),
            ),
            title: Row(
              children: [
                Text('Add Donation'),
              ],
            ),
            subtitle: Text('30.11.2023'),
            trailing: GestureDetector(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2050),
                  );
                },
                child: Icon(
                  Icons.calendar_today,
                  color: Colors.red.shade700,
                )),
          ),
        ),
      ),
    );
  }
}
