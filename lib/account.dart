import 'package:blood/donation_history.dart';

import 'ac_info.dart';
import 'package:flutter/material.dart';

import 'events.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool donateBlood = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.redAccent,
              radius: 120,
              child: CircleAvatar(
                radius: 110,
                backgroundImage: AssetImage('assets/blood.png'),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text('User Name'),
            SizedBox(
              height: 16,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {}, child: Text('Donate your blood')),
                    Spacer(),
                    Switch(
                        value: true,
                        onChanged: (isTrue) {
                          setState(() {
                            donateBlood = isTrue;
                          });
                        })
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Account Info',
                          style: TextStyle(
                            color: Colors.black87,
                            //fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Ac_Info()));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Colors.red.shade800,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
