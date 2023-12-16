import 'package:blood/Widget/profile_summary_card.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'diet_chart.dart';
import 'exercises.dart';
import 'privacy.dart';
import 'support.dart';
import 'events.dart';
import 'package:flutter/material.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.red.shade800,statusBarIconBrightness: Brightness.light));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummaryCard(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    leading: Icon(Icons.event,color: Colors.red.shade800),
                    title: const Text ("Events"),
                    onTap: (){
                      Get.offAll(const Events());
                    },
                    trailing: const Icon(Icons.arrow_forward_ios,size: 20),
                  ),
                  const SizedBox(height: 8,),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    leading: Icon(Icons.support_agent,color: Colors.red.shade800),
                    title: const Text ("Support"),
                    onTap: (){
                      Get.offAll(const Support());
                    },
                    trailing: const Icon(Icons.arrow_forward_ios,size: 20),
                  ),
                  const SizedBox(height: 8,),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    leading: Icon(Icons.privacy_tip_outlined, color: Colors.red.shade800),
                    title: const Text ("Privacy Policy"),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> const privacy())
                      );
                    },
                    trailing: const Icon(Icons.arrow_forward_ios,size: 20),
                  ),
                  const SizedBox(height: 8,),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    leading: Icon(Icons.fitness_center, color: Colors.red.shade800),
                    title: const Text('Exercise Guidelines'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Exercises()));
                    },
                    trailing: const Icon(Icons.arrow_forward_ios,size: 20),
                  ),
                  const SizedBox(height: 8,),
                  ListTile(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                    ),
                    leading: Icon(Icons.fastfood, color: Colors.red.shade800),
                    title: const Text('Diet Chart'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const DietChart()));
                    },
                    trailing: const Icon(Icons.arrow_forward_ios,size: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
