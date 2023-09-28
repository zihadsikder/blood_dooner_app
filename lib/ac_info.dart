import 'package:blood/ac_email_edit.dart';
import 'package:blood/ac_mobile_edit.dart';
import 'package:blood/ac_name_edit.dart';
import 'package:blood/donation_history.dart';
import 'package:blood/login.dart';
import 'package:flutter/material.dart';

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
          title: Text(
            'Blood Donor Bd',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                              Image.asset(
                                'assets/map.png',
                                height: 24,
                                width: 24,
                              ),
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
                              Image.asset(
                                'assets/map.png',
                                height: 24,
                                width: 24,
                              ),
                              Text('A+'),
                              Text('Blood Group'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/map.png',
                                height: 24,
                                width: 24,
                              ),
                              Text('1'),
                              Text('Blood reques'),
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text('Logout'))
            ],
          ),
        ));
  }
}
