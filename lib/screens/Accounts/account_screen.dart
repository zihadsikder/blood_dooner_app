import 'package:blood/controller/auth_controller.dart';
import 'package:blood/screens/main_page.dart';
import 'package:blood/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'AC_Edit/ac_email_edit.dart';
import 'AC_Edit/ac_mobile_edit.dart';
import 'AC_Edit/ac_name_edit.dart';
import '../donation_history.dart';
import '../login.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a Blood Donor"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(const MainPage());
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
                        const Search()), // Use the correct search page
              );
            },
          ),
        ],
        elevation: 10,
      ),
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
                        Text(AuthController.user?.data.name?? 'name',),
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
                            Text(AuthController.user?.data.bloodGroup?? 'blood group',),
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
                            Text(DateFormat.yMd().format(AuthController.user?.data.lastDonation ?? DateTime.now())),
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
              subtitle: Text(AuthController.user?.data.name?? '',),
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
            Container(height: 1,color: Colors.grey.shade100),
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
              subtitle: Text(AuthController.user?.data.email?? '',),
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
            Container(height: 1,color: Colors.grey.shade100),
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
              subtitle: Text("${AuthController.user?.data.address??'' }"),

            ),
            Container(height: 1,color: Colors.grey.shade100),
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
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: const Text('Alert!'),
                      content: const Text('Are You Sure!'),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: const Text('No', style: TextStyle(color: Colors.red),)),
                        TextButton(onPressed: (){
                          Get.offAll(const LoginScreen());
                        }, child: const Text('Yes', style: TextStyle(color: Colors.red),)),
                      ],
                    );

                  } );
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => LoginScreen()));
                  //Get.offAll(const LoginScreen());

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
}
