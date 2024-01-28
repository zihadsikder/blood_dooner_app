import 'package:blood/presentation/state_holders/controller/auth_controller.dart';
import 'package:blood/presentation/state_holders/controller/get_donation_history_controller.dart';
import 'package:blood/presentation/state_holders/controller/logout_controller.dart';
import 'package:blood/presentation/ui/Widget/alert_cancel_button.dart';
import 'package:blood/presentation/ui/Widget/profile_summary_card.dart';
import 'package:blood/presentation/ui/screens/donation_history.dart';
import 'package:blood/presentation/ui/screens/Auth%20Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'Account/account_edit_info.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final getDonationHistoryController = Get.find<GetDonationHistoryController>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummaryCard(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            ListTile(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              leading: const CircleAvatar(
                                backgroundImage: AssetImage('assets/blood.png'),
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    Get.find<AuthController>().model?.data.name ??
                                        'name',
                                  ),
                                ],
                              ),
                              subtitle: const Text('Blood : Available'),
                              trailing: GestureDetector(
                                  onTap: () {
                                    //Get.to(EditProfileScreen());
                                    showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) => const AcName());
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.red.shade800,
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.bloodtype_outlined,
                                        color: Colors.red.shade900,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          '${getDonationHistoryController.donorHistoryList.data?.length ?? 0}'),
                                      GestureDetector(
                                          onTap: () {
                                            Get.to(() => const Donation());
                                          },
                                          child: const Text('Total Donate')),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.bloodtype_outlined,
                                        color: Colors.red.shade900,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        Get.find<AuthController>()
                                                .model
                                                ?.data
                                                .bloodGroup ??
                                            'blood group',
                                      ),
                                      const Text('Blood Group'),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.bloodtype_outlined,
                                        color: Colors.red.shade900,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(DateFormat.yMd().format(
                                          Get.find<AuthController>()
                                                  .model
                                                  ?.data
                                                  .lastDonation ??
                                              DateTime.now())),
                                      const Text('Last Donation'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      leading: Icon(
                        Icons.call,
                        color: Colors.red.shade700,
                        size: 30,
                      ),
                      title: const Row(
                        children: [
                          Text('Mobile'),
                        ],
                      ),
                      subtitle: Text(
                        Get.find<AuthController>().model?.data.name ?? '',
                      ),
                    ),
                    Container(height: 1, color: Colors.grey.shade100),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      leading: Icon(
                        Icons.email_outlined,
                        color: Colors.red.shade700,
                        size: 30,
                      ),
                      title: const Row(
                        children: [
                          Text('Email'),
                        ],
                      ),
                      subtitle: Text(
                        Get.find<AuthController>().model?.data.email ?? '',
                      ),
                    ),
                    Container(height: 1, color: Colors.grey.shade100),
                    ListTile(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      leading: SizedBox(
                        width: 32,
                        //color: Colors.grey,
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/map.png',
                            height: 36,
                            width: 24,
                          ),
                        ),
                      ),
                      title: const Row(
                        children: [
                          Text('Address'),
                        ],
                      ),
                      subtitle: Text(
                          Get.find<AuthController>().model?.data.address.postOffice ??
                              ''),
                    ),
                    Container(height: 1, color: Colors.grey.shade100),
                    const SizedBox(
                      height: 16,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Donate your blood',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                )),
                            const Spacer(),
                            Switch(
                                value: true,
                                onChanged: (isTrue) {
                                  // setState(() {
                                  //   donateBlood = isTrue;
                                  // });
                                })
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    buildLogoutElevatedButton(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const Donation());
          //Get.to(()=>const Donation());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  ElevatedButton buildLogoutElevatedButton(BuildContext context) {
    return ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Row(
                          children: [
                            const Text("Ready to Leave?",
                                style: TextStyle(fontSize: 16)),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                    Icons.highlight_remove_outlined))
                          ],
                        ),
                        content: const Text(
                            'Select "Logout" below if you are ready to end your current session.'),
                        actions: [
                          const AlertCancelButton(),
                          GetBuilder<LogoutController>(
                              builder: (logoutController) {
                            return Visibility(
                              visible:
                                  logoutController.logoutInProgress == false,
                              replacement: const Center(
                                  child: CircularProgressIndicator()),
                              child: TextButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    final bool result =
                                        await logoutController.logout();
                                    if (result) {
                                      Get.offAll(() => const LoginScreen());
                                    } else {
                                      // Handle the case when logout fails
                                    }
                                  }
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.red.shade800),
                                child: const Text('Logout',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            );
                          }),
                        ],
                      );
                    });
              },
              child: const Text('Logout'));
  }
}
