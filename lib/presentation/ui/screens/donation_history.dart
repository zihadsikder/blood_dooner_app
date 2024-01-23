import 'package:blood/presentation/state_holders/controller/donation_history_controller.dart';
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
  final TextEditingController _dateTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,

      body: Padding(
        padding: const EdgeInsets.only(top:80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _paceTEController,
                      decoration: const InputDecoration(
                        hintText: 'Place',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Donation Place';
                        }
                        return null;
                      },
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
                          icon: const Icon(Icons.calendar_today,
                              color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Donation Date';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: GetBuilder<DonationHistoryController>(
                          builder: (donationHistoryController) {
                        return Visibility(
                          visible: donationHistoryController.inProgress == false,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final bool result =
                                    await donationHistoryController.addDonation(
                                        _paceTEController.text.trim(),
                                        _dateTEController.text.trim());
                                if(result){

                                }else{
                                  Get.showSnackbar(GetSnackBar(
                                    title: 'Add Donation Fail',
                                    message: donationHistoryController.errorMessage,
                                    duration: const Duration(seconds: 2),
                                    isDismissible: true,
                                  ));
                                }
                              }
                            },
                            child: const Text(
                              'Add',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              flex: 70,
              child: SingleChildScrollView(
                child: GetBuilder<DonationHistoryController>(
                    builder: (donationHistoryController) {
                      return ListView.builder(
                          itemCount: donationHistoryController.donationList.length,
                          itemBuilder: (context, index) {
                            // Assuming Donation is a class with place and date properties
                            final donation =
                            donationHistoryController.donationList[index];

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
                              title: Text(donation.place),
                              subtitle:Text('Date: ${donation.date}'),
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
                        });
                  }
                ),
              ),
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
          Get.to(const AccountScreen());
        },
      ),
    );
  }
}

