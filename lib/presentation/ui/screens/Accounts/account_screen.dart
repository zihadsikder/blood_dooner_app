import 'package:blood/presentation/state_holders/controller/auth_controller.dart';
import 'package:blood/presentation/ui/screens/donation_history.dart';
import 'package:blood/presentation/ui/screens/login_screen.dart';
import 'package:blood/presentation/ui/screens/main_bottom_nav_screens.dart';
import 'package:blood/presentation/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'AC_Edit/ac_email_edit.dart';
import 'AC_Edit/ac_mobile_edit.dart';
import 'AC_Edit/ac_name_edit.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/blood.png'),
                    ),
                    title: Row(
                      children: [
                        Text(
                          Get.find<AuthController>().model?.data.name ?? 'name',
                        ),
                      ],
                    ),
                    subtitle: const Text('Blood : Available'),
                    trailing: GestureDetector(
                        onTap: () {
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
                            const Text('1'),
                            GestureDetector(
                                onTap: () {
                                  Get.offAll(const Donation());
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
              trailing: GestureDetector(
                  onTap: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const AcMobile());
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.red.shade700,
                  )),
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
              trailing: GestureDetector(
                  onTap: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => const AcEmail());
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.red.shade800,
                  )),
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
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return aleartDailog(context);
                      });
                },
                child: const Text('Logout')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAll(const Donation());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Search a Blood Donor"),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Get.offAll(const MainBottomNavScreen());
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const SearchScreen()), // Use the correct search page
            );
          },
        ),
      ],
      elevation: 10,
    );
  }

  AlertDialog aleartDailog(BuildContext context) {
    return AlertDialog(
      title: const Text('Alert!'),
      content: const Text('Are You Sure!'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'No',
              style: TextStyle(color: Colors.red),
            )),
        TextButton(
            onPressed: () {
              Get.offAll(const LoginScreen());
            },
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.red),
            )),
      ],
    );
  }
}
