import 'package:blood/Widget/profile_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/service_data.dart';

class OtherService extends StatefulWidget {
  const OtherService({super.key});

  @override
  State<OtherService> createState() => _OtherServiceState();
}

class _OtherServiceState extends State<OtherService> {
  final List<ServiceData> websites = [
    ServiceData(
      name: 'BD Tickets',
      link: 'https://bdtickets.com',
      profilePicUrl:
          "https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ),ServiceData(
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
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileSummaryCard(),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                          //Image.network("https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
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
            ),
          ],
        ),
      )),
    );
  }
}
