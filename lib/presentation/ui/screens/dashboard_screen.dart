import 'package:blood/data/model/service_data.dart';
import 'package:blood/presentation/ui/Widget/carusel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
      name: 'Bus Tickets',
      link: 'https://bdtickets.com/',
      profilePicAsset: "assets/bus.png",
    ),
    ServiceData(
      name: 'Train Tickets',
      link: 'https://eticket.railway.gov.bd/',
      profilePicAsset: "assets/train.png",
    ),
    ServiceData(
      name: 'Biman Tickets',
      link: 'https://www.biman-airlines.com/',
      profilePicAsset: "assets/biman.png",
    ),
    ServiceData(
      name: 'Result',
      link: 'http://www.educationboardresults.gov.bd/',
      profilePicAsset: "assets/result.png",
    ),
    ServiceData(
      name: 'Bd Jobs',
      link: 'https://www.bdjobs.com/',
      profilePicAsset: "assets/bdjobs.png",
    ),
    ServiceData(
      name: 'XI Admission',
      link: 'https://xiclassadmission.com.bd/',
      profilePicAsset: "assets/admission.png",
    ),

  ];

  Future<void> _launchUrl(String url) async {
    if (!await launch(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.red.shade800,
        statusBarIconBrightness: Brightness.light));
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const ProfileSummaryCard(),
              //const BannerCarousel(),
              const CarouselSliderWidget(),
              const SizedBox(height: 16),
              Expanded(
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
                        elevation: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              websites[index].profilePicAsset,
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
        ),
      ),
    );
  }
}
