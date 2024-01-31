import 'package:blood/presentation/ui/Widget/bener_carusal.dart';
import 'package:blood/presentation/ui/Widget/profile_summary_card.dart';
import 'package:blood/presentation/ui/screens/search_screen.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.red.shade800,
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const ProfileSummaryCard(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BannerCarousel(),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                        onPressed: () {
                          Get.to(() => const SearchScreen());
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              size: 32,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'FIND DONOR',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        )),
                    Image.asset('assets/savelife.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      title: const Text("Search a Blood Donor"),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Get.to(const SearchScreen());
          },
        ),
      ],
      elevation: 10,
    );
  }

}
