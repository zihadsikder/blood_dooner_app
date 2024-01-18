import 'package:blood/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Accounts/account_screen.dart';

class Donation extends StatefulWidget {
  const Donation({super.key});

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  final TextEditingController _paceTEController = TextEditingController();
  final TextEditingController _dateTEController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: buildAppBar,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: Column(
                children: [
                  TextFormField(
                    controller: _paceTEController,
                    decoration: const InputDecoration(
                      hintText: 'Place',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _dateTEController,
                    decoration: InputDecoration(
                      hintText: 'Date of Donation',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2050),
                          );
                          if (pickedDate != null &&
                              pickedDate != _dateTEController.text) {
                            setState(() {
                              _dateTEController.text =
                              "${pickedDate.toLocal()}".split(' ')[0];
                            });
                          }
                        },
                        icon:
                            const Icon(Icons.calendar_today, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              flex: 70,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.zero,
                        ),
                        tileColor: Colors.grey.shade200,
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Text('${index + 1}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        title: const Text('CTG Medical'),
                        subtitle: const Text('Date: ${12/12/24}'),
                        trailing: const Icon(
                          Icons.delete_outline_sharp,
                        ),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Alert!'),
                                  content: const Text(
                                      'Are You Sure! Want to delete your donation history?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.red),
                                        )),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Okk',
                                          style: TextStyle(color: Colors.red),
                                        )),
                                  ],
                                );
                              });
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
        title: const Text('Donation History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(const AccountScreen());
          },
        ),
      );
  }
}

class Todo {
  String name;
  String description;

  Todo(
    this.name,
    this.description,
  );
}
