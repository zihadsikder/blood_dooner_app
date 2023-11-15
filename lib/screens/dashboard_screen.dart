import 'package:blood/model/service_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Widget/profile_summary_card.dart';

// class Dashboard_Screen extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               ProfileSummaryCard(),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class Dashboard_Screen extends StatefulWidget {
  const Dashboard_Screen({super.key});

  @override
  State<Dashboard_Screen> createState() => _Dashboard_ScreenState();
}

class _Dashboard_ScreenState extends State<Dashboard_Screen> {
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

