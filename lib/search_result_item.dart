import 'package:flutter/material.dart';

class SearchResultItem extends StatelessWidget {
  final String name;
  final String bloodGroup;
  final String lastDonation;
  final String totalDonations;
  final String address;

  const SearchResultItem({
    required this.name,
    required this.bloodGroup,
    required this.lastDonation,
    required this.totalDonations,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Row(
            children: [
              Text(
                '$name  ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //Spacer(), // Adds spacing between name and blood group
              Container(
                width: 36, // Adjust the width as needed
                height: 36, // Adjust the height as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors
                      .grey.shade200, // You can change the color as needed
                ),
                child: Center(
                  child: Text(
                    '$bloodGroup',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                    ),
                  ),
                ),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Last Donation: $lastDonation'),
              Text('Total Donations: $totalDonations'),
              Text('Address: $address'),
            ],
          ),
          // Add call and sms buttons here
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.phone, color: Colors.red.shade800),
                onPressed: () {
                  // Implement call functionality here
                },
              ),
              IconButton(
                icon: Icon(Icons.sms, color: Colors.red.shade800),
                onPressed: () {
                  // Implement SMS functionality here
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
