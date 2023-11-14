import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Widget/profile_summary_card.dart';


class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileSummaryCard(),

            ],
          ),
        ),
      ),
    );
  }
}