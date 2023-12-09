import 'package:blood/Widget/profile_summary_card.dart';
import 'package:flutter/services.dart';

import 'diet_chart.dart';
import 'exercises.dart';
import 'privacy.dart';

import 'support.dart';
import 'events.dart';
import 'package:flutter/material.dart';
class Settings_screen extends StatefulWidget {
  const Settings_screen({super.key});

  @override
  State<Settings_screen> createState() => _Settings_screenState();
}

class _Settings_screenState extends State<Settings_screen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.red.shade800,statusBarIconBrightness: Brightness.light));
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ProfileSummaryCard(),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.event,color: Colors.red.shade800),
                title: Text ("Events"),
                onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Events())
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.support_agent,color: Colors.red.shade800),
                title: Text ("Support"),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> Support())
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.privacy_tip_outlined, color: Colors.red.shade800),
                title: Text ("Privacy Policy"),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> privacy())
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.fitness_center, color: Colors.red.shade800),
                title: Text('Exercise Guidelines'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Exercises()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.fastfood, color: Colors.red.shade800),
                title: Text('Diet Chart'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DietChart()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}