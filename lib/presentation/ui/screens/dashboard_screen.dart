import 'package:blood/data/model/service_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Widget/profile_summary_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<ServiceData> websites = [
    ServiceData(
      name: 'BD Tickets',
      link: 'https://bdtickets.com',
      profilePicUrl:
          "https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
    ServiceData(
      name: 'BD Tickets',
      link: 'https://bdtickets.com',
      profilePicUrl:
          "https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),
  ];

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.red.shade800,
        statusBarIconBrightness: Brightness.light));
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfileSummaryCard(),
            serviceData,
          ],
        ),
      )),
    );
  }

  Expanded get serviceData {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: websites.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _launchUrl(websites[index].link);
            },
            child: Card(
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    websites[index].profilePicUrl,
                    fit: BoxFit.cover,
                    // width: 100,
                    // height: 100,
                  ),
                  Text(websites[index].name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
