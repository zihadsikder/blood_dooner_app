import 'package:blood/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:blood/presentation/ui/Widget/location_from.dart';
import 'package:blood/presentation/ui/screens/search_result_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedBloodGroup = 'A+';
  String selectedDivision = 'Select Division';
  String selectedDistrict = '';
  String selectedUpzila ='';
  String selectedUnion ='';

  List<Map<String, String>> searchResults = [
    {
      'name': 'Zihad',
      'bloodGroup': 'A+',
      'lastDonation': '2023-09-01',
      'totalDonations': '5',
      'address' : 'kutubdia, CoxsBazar'
    },
    {
      'name': 'Anik',
      'bloodGroup': 'B-',
      'lastDonation': '2023-08-25',
      'totalDonations': '3',
      'address' : 'Sersha, Chattogram'
    },
    {
      'name': 'Anik',
      'bloodGroup': 'B-',
      'lastDonation': '2023-08-25',
      'totalDonations': '3',
      'address' : 'Sersha, Chattogram'
    },
    {
      'name': 'Anik',
      'bloodGroup': 'B-',
      'lastDonation': '2023-08-25',
      'totalDonations': '3',
      'address' : 'Sersha, Chattogram'
    },
    {
      'name': 'Anik',
      'bloodGroup': 'B-',
      'lastDonation': '2023-08-25',
      'totalDonations': '3',
      'address' : 'Sersha, Chattogram'
    },
    // Add more search results as needed
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: buildAppBar,
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LocationFormScreen(
                  selectedBloodGroup: selectedBloodGroup,
                  selectedDivision: selectedDivision,
                  selectedDistrict: selectedDistrict,
                  selectedUpzila: selectedUpzila,
                  selectedUnion: selectedUnion,
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: const Text(
                      'Search',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Display search results as a ListView
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    return SearchResultItem(
                      name: searchResults[index]['name'] ?? '',
                      bloodGroup: searchResults[index]['bloodGroup'] ?? '',
                      lastDonation: searchResults[index]['lastDonation'] ?? '',
                      totalDonations: searchResults[index]['totalDonations'] ?? '',
                      address: searchResults[index]['address'] ?? '',
                      // You can also include call and SMS functionality here
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      title: const Text("Find A Blood Donor"),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
    );
  }
}


