import 'package:blood/presentation/ui/Widget/profile_summary_card.dart';
import 'package:blood/presentation/ui/screens/search_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.height,});

  final double? height;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageUrls = [
    'assets/rltn.png',
    'assets/donation.png',
    'assets/2.png',
    //'assets/6.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
  ];

  int _selectedIndex = 0;

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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: carousalSlider,
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

  Column get carousalSlider {
    return Column(children: [
      CarouselSlider.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(imageUrls[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        //Slider Container properties
        options: CarouselOptions(
          height:widget.height ?? 300.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
          onPageChanged: (index, reason) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < imageUrls.length; i++)
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _selectedIndex == i ? Colors.red : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
              ],
            ),
        ],
      ),
    ]);
  }
}
