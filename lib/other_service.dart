import 'package:blood/Widget/profile_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class OtherService extends StatefulWidget {
  const OtherService({super.key});

  @override
  State<OtherService> createState() => _OtherServiceState();
}

class _OtherServiceState extends State<OtherService> {
  final List<WebsiteData> websites = [
    WebsiteData(
      name: 'BD Tickets',
      link: 'https://bdtickets.com/?utm_source=google_Search&utm_medium=ada&utm_campaign=2210117408_P03_BDtickets_Search_Q4_22&utm_content=Category_Search_Q4_22&gclid=Cj0KCQiAr8eqBhD3ARIsAIe-buND0Jqn3Ete4jzChap9KeVNUEDhX2EQBYCEiuqapzn0dd3wVPIf-1saArLREALw_wcB',
      profilePicUrl: 'data:image/jpeg;base64,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',
    ),
  ];

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
                    onTap: () {},
                    child: Card(
                      elevation: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            websites[index].profilePicUrl,
                            width: 100,
                            height: 100,
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

class WebsiteData {
  final String name;
  final String link;
  final String profilePicUrl;

  WebsiteData({
    required this.name,
    required this.link,
    required this.profilePicUrl,
  });
}
