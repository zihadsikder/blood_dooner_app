import 'package:blood/ac_mobile_edit.dart';
import 'package:blood/forget_pass.dart';

import 'main_page.dart';

import 'register.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.red.shade900,
                  Colors.red.shade800,
                  Colors.red.shade500,
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 36),),
                      SizedBox(height: 10,),
                      Text("A Smart Blood Donatin System", style: TextStyle(color: Colors.white, fontSize: 10),),
                    ],
                  ),
                  Image.asset('assets/bloodbd.png', // Replace with your image path
                    width: 150, // Adjust the width as needed
                    height: 80, // Adjust the height as needed
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children:[
                      SizedBox(height: 40,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10)
                          )]
                      ),
                      child: Column(
                        children:[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Phone number",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                          //SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => ForgetPass()
                        );
                      },
                    child : Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
                    ),
                    SizedBox(height: 16,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context)=> Mainpage())
                        );
                      },
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red.shade800
                        ),
                        child: Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 0,),
                        Row(
                          children:[
                            Text('Does not have account?',style: TextStyle(color: Colors.grey.shade500),),
                            TextButton(
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.red,fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=> Register())
                                );
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        SizedBox(height: 0,),
                    Text("Continue with social media", style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 16,),
                    Row(
                      children:[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Your onTap action here
                              // For example, you can open Facebook when tapped
                              launchFacebook();
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.red.shade800,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.facebook, // You can change this to the desired Facebook icon
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8), // Adjust the spacing between icon and text
                                  Text(
                                    "Facebook",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                          SizedBox(width: 30,),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Your onTap action here
                                // For example, you can open Facebook when tapped
                                launchGoogle();
                              },
                            child:Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red.shade800
                              ),
                              child: Center(
                                child: Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                          ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



}
void launchGoogle() {}
void launchFacebook() {}
