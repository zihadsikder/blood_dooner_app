import 'package:blood/screens/search_result_item.dart';

import '../Widget/location_from.dart';

import 'package:flutter/material.dart';


class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find A Blood Donor"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LocationForm(
                selectedBloodGroup: selectedBloodGroup,
                selectedDivision: selectedDivision,
                selectedDistrict: selectedDistrict,
                selectedUpzila: selectedUpzila,
                selectedUnion: selectedUnion,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Simulate a search, you can replace this with your search logic
                  setState(() {
                    // Update searchResults with actual search results
                    // Here, we are using sample data
                  });
                },
                child: const Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
    );
  }
}


