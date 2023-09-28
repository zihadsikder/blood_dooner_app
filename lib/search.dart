import 'search_result_item.dart';
import 'package:flutter/material.dart';
import 'constants/location_from.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String selectedBloodGroup = 'A+';
  String selectedDivision = 'Select Division';
  String selectedDistrict = 'Select District';
  // Sample search results
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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Find A Blood Donor"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Location(
                selectedBloodGroup: selectedBloodGroup,
                selectedDivision: selectedDivision,
                selectedDistrict: selectedDistrict,
                onBloodGroupChanged: (newValue) {
                  setState(() {
                    selectedBloodGroup = newValue;
                  });
                },
                onDivisionChanged: (newValue) {
                  setState(() {
                    selectedDivision = newValue;
                  });
                },
                onDistrictChanged: (newValue) {
                  setState(() {
                    selectedDistrict = newValue;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Simulate a search, you can replace this with your search logic
                  setState(() {
                    // Update searchResults with actual search results
                    // Here, we are using sample data
                  });
                },
                child: Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // Display search results as a ListView
              ListView.builder(
                shrinkWrap: true,
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


