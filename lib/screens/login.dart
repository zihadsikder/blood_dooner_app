import 'forget_pass_screen/forgot_password_screen.dart';
import 'main_page.dart';
import 'sign_up_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _numberTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _loginInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.red.shade900,
          Colors.red.shade800,
          Colors.red.shade500,
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(color: Colors.white, fontSize: 36),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "A Smart Blood Donatin System",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/bloodbd.png', // Replace with your image path
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
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _numberTEController,
                                    decoration: InputDecoration(
                                        hintText: "Phone number",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    validator: (String? value) {
                                      if (value?.trim().isEmpty ?? true) {
                                        return 'Enter valid number';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                //SizedBox(height: 20),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextFormField(
                                      controller: _passwordTEController,
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                      validator: (String? value) {
                                        if (value?.trim().isEmpty ?? true) {
                                          return 'Enter valid email';
                                        }
                                        return null;
                                      },
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Mainpage()));
                            },
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red.shade800),
                              child: Visibility(
                                visible: _loginInProgress == false,
                                replacement: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => ForgotPasswordScreen());
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text(
                                "Don't have account?",
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                              TextButton(
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen()));
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),

                          // Text("Continue with social media", style: TextStyle(color: Colors.grey),),
                          // SizedBox(height: 16,),
                          // Row(
                          //   children:[
                          //     Expanded(
                          //       child: GestureDetector(
                          //         onTap: () {
                          //           // Your onTap action here
                          //           // For example, you can open Facebook when tapped
                          //           launchFacebook();
                          //         },
                          //         child: Container(
                          //           height: 50,
                          //           decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(50),
                          //             color: Colors.red.shade800,
                          //           ),
                          //           child: Row(
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             children: [
                          //               Icon(
                          //                 Icons.facebook, // You can change this to the desired Facebook icon
                          //                 color: Colors.white,
                          //               ),
                          //               SizedBox(width: 8), // Adjust the spacing between icon and text
                          //               Text(
                          //                 "Facebook",
                          //                 style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.bold,
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //       SizedBox(width: 30,),
                          //       Expanded(
                          //         child: GestureDetector(
                          //           onTap: () {
                          //             // Your onTap action here
                          //             // For example, you can open Facebook when tapped
                          //             launchGoogle();
                          //           },
                          //         child:Container(
                          //           height: 50,
                          //           decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(50),
                          //               color: Colors.red.shade800
                          //           ),
                          //           child: Center(
                          //             child: Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          //           ),
                          //         ),
                          //       ),
                          //       ),
                          //       ],
                          //     )
                        ],
                      ),
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

  // Future<void> login() async {
  //   if (!_formKey.currentState!.validate()) {
  //     return;
  //   }
  //   _loginInProgress = true;
  //   if (mounted) {
  //     setState(() {});
  //   }
  //   NetworkResponse response = await NetworkCaller().postRequest(Urls.login, body: {
  //     'email' : _emailTEController.text.trim(),
  //     'password' : _passwordTEController.text,
  //   });
  //   _loginInProgress = false;
  //   if (mounted) {
  //     setState(() {});
  //   }
  //   if (response.isSuccess) {
  //     await AuthController.saveUserInformation(
  //         response.jsonResponse['token'], UserModel.fromJson(response.jsonResponse['data']));
  //     if (mounted) {
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const MainBottomNavScreen()));
  //     }
  //   } else {
  //     if (response.statusCode == 401) {
  //       if (mounted) {
  //         showSnackMessage(context, 'Please check email/password');
  //       }
  //     } else {
  //       if (mounted) {
  //         showSnackMessage(context, 'Login failed. Try again');
  //       }
  //     }
  //   }
  // }
  @override
  void dispose() {
    _numberTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
