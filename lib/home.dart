// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// class Home extends StatelessWidget {
//   final List<String> imageUrls = [
//     'assets/rltn.png',
//     'assets/donation.png',
//     'assets/2.png',
//     'assets/3.png',
//     'assets/4.png',
//     'assets/5.png',
//     //  Add more image URLs as needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           CarouselSlider.builder(
//             itemCount: imageUrls.length,
//             itemBuilder: (context, index, realIndex) {
//               return Container(
//                 margin: EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//                   image: DecorationImage(
//                     image: AssetImage(imageUrls[index]),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               );
//             },
//
//             // Slider Container properties
//             options: CarouselOptions(
//               height: 300.0,
//               enlargeCenterPage: true,
//               autoPlay: true,
//               aspectRatio: 16 / 9,
//               autoPlayCurve: Curves.fastOutSlowIn,
//               enableInfiniteScroll: true,
//               autoPlayAnimationDuration: Duration(milliseconds: 800),
//               viewportFraction: 0.8,
//             ),
//           ),
//           SizedBox(height: 8.0), // Add some spacing
//
//           // Here's your donation picture wrapped in an Expanded widget
//           Expanded(
//             child: Image.asset(
//               'assets/donation.png',
//               fit: BoxFit.cover, // You can adjust this to fit your needs
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/rltn.png',
    'assets/donation.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: EdgeInsets.all(8.0),
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
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            SizedBox(height: 8.0), // Add some space between the carousel and the image

            // Your donation picture with desired size
            // Image.asset(
            //   'assets/donation.png',
            //   width: 300, // Adjust the width as needed
            //   height: 250, // Adjust the height as needed
            // ),
          //   Expanded(
          //   child: Image.asset(
          //     'assets/donation.png',
          //     fit: BoxFit.cover, // You can adjust this to fit your needs
          //   ),
          // ),

            // Add more widgets or content below as needed
          ],
        ),
      ),
    );
  }
}