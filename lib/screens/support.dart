import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatelessWidget {
  const Support({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GIVE BLOOD SAVE LIFE"),
        backgroundColor: Colors.red.shade900,
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.phone_rounded, color: Colors.red.shade800),
                  title: Text("+880 157 5589 936", style: TextStyle()),
                  onTap: () {
                    _launchPhoneDialer("+8801575589936");
                  },
                ),
                SizedBox(height: 8,),
                //Container(height: 1, color: Colors.grey,),
                ListTile(
                  leading: Icon(Icons.email_outlined, color: Colors.red.shade800),
                  title: Text("islanditltd@gmail.com"),
                  onTap: () {
                    _launchEmailSubmission("islanditltd@gmail.com");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to launch the phone dialer
  _launchPhoneDialer(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  // Function to launch the email dialer
  void _launchEmailSubmission(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
