import 'package:carousel_slider/carousel_slider.dart';
import 'search.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

// ignore: camel_case_types
class _Home_ScreenState extends State<Home_Screen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> imageUrls = [
    'assets/rltn.png',
    'assets/donation.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    // Add more image URLs as needed
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a Blood Donar"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const Search()), // Use the correct search page
              );
            },
          ),
        ],
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index, realIndex) {
                  print("selected index ::: $index");
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
                  height: 300.0,
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
                            color: _selectedIndex == i
                                ? Colors.orange
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search()));
                  },
                  child: Row(
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
                        'Search A Donor',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  )),
              // Row(
              //   children: [
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => const Search()),
              //           );
              //         },
              //         child: Container(
              //           padding: const EdgeInsets.symmetric(
              //             horizontal: 8,
              //             vertical: 16,
              //           ),
              //           decoration: BoxDecoration(
              //             color: Colors.red.shade900,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: const Column(
              //             children: [
              //               Icon(
              //                 Icons.search,
              //                 color: Colors.white,
              //                 size: 32,
              //               ),
              //               Text(
              //                 'Emergency Search',
              //                 style: TextStyle(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: 16),
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => const Search()),
              //           );
              //         },
              //         child: Container(
              //           padding: const EdgeInsets.symmetric(
              //             horizontal: 8,
              //             vertical: 16,
              //           ),
              //           decoration: BoxDecoration(
              //             color: Colors.red.shade900,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: const Column(
              //             children: [
              //               Icon(
              //                 Icons.search,
              //                 color: Colors.white,
              //                 size: 32,
              //               ),
              //               Text(
              //                 'Search a Doner',
              //                 style: TextStyle(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => const Search()),
              //           );
              //         },
              //         child: Container(
              //           padding: const EdgeInsets.symmetric(
              //             horizontal: 8,
              //             vertical: 8,
              //           ),
              //           decoration: BoxDecoration(
              //             color: Colors.red.shade900,
              //             borderRadius: BorderRadius.circular(8),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Icon(
              //                 Icons.search,
              //                 color: Colors.white,
              //                 size: 32,
              //               ),
              //              SizedBox(
              //                width: 8,
              //              ),
              //               Text(
              //                 'Search a Doner',
              //                 style: TextStyle(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.bold,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              Image.asset('assets/savelife.png'),
            ],
          ),
        ),
      ),
    );
  }
}