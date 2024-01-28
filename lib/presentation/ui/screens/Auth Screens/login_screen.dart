import 'package:blood/presentation/state_holders/controller/login_controller.dart';
import 'package:blood/presentation/ui/Widget/snack_message.dart';
import 'package:blood/presentation/ui/screens/Auth%20Screens/forgot_password_screen.dart';
import 'package:blood/presentation/ui/screens/main_bottom_nav_screens.dart';
import 'package:get/get.dart';
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
  final LoginController _loginController = Get.find<LoginController>();

  bool _obscureText = true;

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
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
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
                        "A Smart Blood Donation System",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/blood.png',
                    width: 150,
                    height: 80,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: textField,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              final bool result = await _loginController.login(
                                  _numberTEController.text.trim(),
                                  _passwordTEController.text);
                              if (result) {
                                Get.to(const MainBottomNavScreen());
                                if (mounted) {
                                  showSnackMessage(
                                      context, _loginController.failureMessage);
                                }
                              } else {
                                if (mounted) {
                                  showSnackMessage(
                                      context, _loginController.failureMessage);
                                }
                              }
                            },
                            child: Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red.shade800),
                              child: GetBuilder<LoginController>(
                                  builder: (loginController) {
                                return Visibility(
                                  visible:
                                      loginController.loginInProgress == false,
                                  replacement: const Center(
                                      child: CircularProgressIndicator()),
                                  child: const Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) =>
                                      const ForgotPasswordScreen());
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                  Get.to(() => const SignUpScreen());
                                },
                              )
                            ],
                          ),
                          const Text(
                            "Continue with social media",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
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
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.facebook,
                                          // You can change this to the desired Facebook icon
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 8),
                                        // Adjust the spacing between icon and text
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
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    // Your onTap action here
                                    // For example, you can open Facebook when tapped
                                    launchGoogle();
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.red.shade800),
                                    child: const Center(
                                      child: Text(
                                        "Google",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Column get textField {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: _numberTEController,
            decoration: const InputDecoration(
                hintText: "Mobile",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Your Number';
              }
              return null;
            },
          ),
        ),
        //SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
          child: TextFormField(
            controller: _passwordTEController,
            obscureText: _obscureText,
            // Use a boolean variable to toggle password visibility
            decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText =
                          !_obscureText; // Toggle the password visibility
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey, // Customize the icon color as needed
                  ),
                )),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter Correct Password';
              }
              return null;
            },
            keyboardType: TextInputType.visiblePassword,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _numberTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

  void launchFacebook() {}

  void launchGoogle() {}
}
