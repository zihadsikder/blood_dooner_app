import 'privacy.dart';

import 'support.dart';
import 'events.dart';
import 'package:flutter/material.dart';
class Moor extends StatefulWidget {
  const Moor({super.key});

  @override
  State<Moor> createState() => _MoorState();
}

class _MoorState extends State<Moor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 8,),
            ListTile(
              leading: Icon(Icons.event,color: Colors.red.shade800),
              title: Text ("Events"),
              onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Events())
                );
              },
            ),
            SizedBox(height: 8,),
            ListTile(
              leading: Icon(Icons.support_agent,color: Colors.red.shade800),
              title: Text ("Support"),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Support())
                );
              },
            ),
            SizedBox(height: 8,),
            ListTile(
              leading: Icon(Icons.privacy_tip_outlined, color: Colors.red.shade800),
              title: Text ("Privacy Policy"),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> privacy())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
