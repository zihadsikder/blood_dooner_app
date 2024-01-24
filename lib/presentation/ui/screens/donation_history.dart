import 'package:blood/presentation/state_holders/controller/add_donation_history_controller.dart';
import 'package:blood/presentation/state_holders/controller/get_donation_history_controller.dart';
import 'package:blood/presentation/ui/Widget/alert_cancel_button.dart';
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
      appBar: AppBar(
        title: const Text('Donation History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(const AccountScreen());
          },
        ),
      ),
      body: Column(
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
                      hintText: 'Donation Place',
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
                        replacement: const Center(child: CircularProgressIndicator()),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final String place = _paceTEController.text.trim();
                              final String date = _dateTEController.text.trim();
                              final bool result = await donationHistoryController.addDonation(place, date);
                              if(result){
                                _paceTEController.clear();
                                _dateTEController.clear();
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
          getDonorList,
        ],
      ),
    );
  }

  Expanded get getDonorList {
    return Expanded(
            flex: 70,
            child: GetBuilder<GetDonationHistoryController>(
                builder: (getDonationHistoryController) {
                  return ListView.builder(
                      itemCount: getDonationHistoryController.donorHistoryList.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        final donation = getDonationHistoryController.donorHistoryList.data![index];

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
                          title: Text(donation.donationPlace?? ''),
                          subtitle:Text('Date: ${donation.donationDate ?? DateTime.now()}'),
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
                                      const AlertCancelButton(),
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
          );
  }

  @override
  void dispose(){
    _paceTEController.dispose();
    _dateTEController.dispose();
    super.dispose();
  }
}

