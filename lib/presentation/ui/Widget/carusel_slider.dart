import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    Key? key,
    this.height,
  }) : super(key: key);

  final double? height;

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {

  final List<String> imageUrls = [
    'assets/blood1.jpeg',
    'assets/blood2.jpeg',
    'assets/blood3.jpeg',
    'assets/blood4.png',
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          height:widget.height ?? 180.0,
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
