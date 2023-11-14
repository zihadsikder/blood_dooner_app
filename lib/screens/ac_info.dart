import 'package:blood/screens/ac_email_edit.dart';
import 'package:blood/screens/search.dart';

import 'package:flutter/material.dart';

import 'ac_mobile_edit.dart';
import 'ac_name_edit.dart';
import 'donation_history.dart';
import 'login.dart';

class Ac_Info extends StatefulWidget {
  const Ac_Info({super.key});

  @override
  State<Ac_Info> createState() => _Ac_InfoState();
}

class _Ac_InfoState extends State<Ac_Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search a Blood Donar"),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search()), // Use the correct search page
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
                  side: BorderSide(width: 0, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/blood.png'),
                      ),
                      title: Row(
                        children: [
                          Text('User Name'),
                        ],
                      ),
                      subtitle: Text('Blood : Available'),
                      trailing: GestureDetector(
                          onTap: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => AcName());
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
                              Icon(Icons.bloodtype_outlined,color: Colors.red.shade900,),
                              SizedBox(height: 5,),
                              // Image.asset(
                              //   'assets/map.png',
                              //   height: 24,
                              //   width: 24,
                              // ),
                              Text('1'),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Donation()));
                                  },
                                  child: Text('Total Donate')),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.bloodtype_outlined,color: Colors.red.shade900,),
                              SizedBox(height: 5,),
                              // Image.asset(
                              //   'assets/map.png',
                              //   height: 24,
                              //   width: 24,
                              // ),
                              Text('A+'),
                              Text('Blood Group'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.bloodtype_outlined,color: Colors.red.shade900,),
                              SizedBox(height: 5,),
                              // Image.asset(
                              //   'assets/map.png',
                              //   height: 24,
                              //   width: 24,
                              // ),
                              Text('11-11-23'),
                              Text('Total donation'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                leading: Icon(
                  Icons.call,
                  color: Colors.red.shade700,
                  size: 30,
                ),
                title: Row(
                  children: [
                    Text('Mobile'),
                  ],
                ),
                subtitle: Text('018000000000'),
                trailing: GestureDetector(
                    onTap: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AcMobile());
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.red.shade700,
                    )),
              ),
              Container(
                height: 1,
                color: Colors.red.shade400,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                leading: Icon(
                  Icons.email_outlined,
                  color: Colors.red.shade700,
                  size: 30,
                ),
                title: Row(
                  children: [
                    Text('Email'),
                  ],
                ),
                subtitle: Text('norplay@gmail.com'),
                trailing: GestureDetector(
                    onTap: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AcEmail());
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.red.shade800,
                    )),
              ),
              Container(
                height: 1,
                color: Colors.red.shade400,
              ),
              ListTile(
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
                      'assets/map.png',
                      height: 36,
                      width: 24,
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Text('Address'),
                  ],
                ),
                subtitle: Text('Chattogram'),
                // trailing: GestureDetector(
                //     onTap: () {
                //       showDialog(
                //           barrierDismissible: false,
                //           context: context,
                //           builder: (context) => AcAddress());
                //     },
                //     child: Icon(
                //       Icons.edit,
                //       color: Colors.red.shade800,
                //     )),
              ),
              Container(
                height: 1,
                color: Colors.red.shade400,
              ),
              SizedBox(
                height: 16,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {}, child: Text('Donate your blood',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                      Spacer(),
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
              SizedBox(height: 16,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text('Logout'))
            ],
          ),
        ));
  }
}
