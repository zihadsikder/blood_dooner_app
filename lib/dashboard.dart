import 'package:blood/register.dart';
import 'search.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w =MediaQuery.of(context).size.width;
    double h =MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a Blood Donar"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()), // Use the correct search page
              );
            },
          ),
        ],
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Image.asset('assets/savelife.png'),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Search()),
                    );
                  },
                      child: Text('Search a Doner',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      ),
                ),
                SizedBox(height: 5,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Register()),
                    );
                  },
                  child: Text('Create account',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return Container(
    //   child: Center(
    //     child: Text("Welcome to Dashboard"),
    //   ),
    // );
  }

}
