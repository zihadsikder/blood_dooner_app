import 'package:blood/controller/sign_up_controller.dart';
import 'package:blood/screens/login.dart';
import 'package:get/get.dart';
import '../Widget/location_from.dart';
import 'package:flutter/material.dart';
import '../Widget/snack_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameTEController = TextEditingController();
  final TextEditingController _mobileNumberTEController =
      TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _postOfficeTEController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _donationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.find<SignUpController>();

  bool _weightOver50Controller = false;
  bool areFieldsValid = false;
  String selectedBloodGroup = 'A+';
  String selectedDivision = 'Select Division';
  String selectedDistrict = '';
  String selectedThana = '';
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Registration'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: w,
                          height: h * 0.3,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/bbbb.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Donate Blood, Save A Life",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.red.shade900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Provide Your Information",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextFormField(
                          controller: _usernameTEController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Location(
                          selectedBloodGroup: selectedBloodGroup,
                          selectedDivision: selectedDivision,
                          selectedDistrict: selectedDistrict,
                          selectedThana: selectedThana,
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: _postOfficeTEController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Post Office',
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your post office';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailTEController,
                          decoration: const InputDecoration(
                            labelText: "Email",
                          ),
                          validator: (String? value) {
                            // if (value?.trim().isEmpty ?? true) {
                            //   return 'Enter a valid email';
                            // }
                            // Email validation with '@' and '.'
                            bool isValidEmail = RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(value!);

                            if (!isValidEmail) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: _dobController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Date of Birth',
                            suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2050),
                                );

                                if (pickedDate != null &&
                                    pickedDate != _dobController.text) {
                                  setState(() {
                                    _dobController.text =
                                        "${pickedDate.toLocal()}".split(' ')[0];
                                  });
                                }
                              },
                              icon: const Icon(Icons.calendar_today,
                                  color: Colors.grey),
                            ),
                          ),
                          keyboardType: TextInputType.datetime,
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your Date of Birth';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: _mobileNumberTEController,
                          decoration: const InputDecoration(
                            labelText: 'Mobile',
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (String? value) {
                            // if (value?.trim().isEmpty ?? true) {
                            //   return 'Enter a valid mobile number';
                            // }
                            // Phone number validation
                            bool isValidPhoneNumber =
                                RegExp(r"^0[0-9]{10}$").hasMatch(value!);

                            if (!isValidPhoneNumber) {
                              return 'Enter a valid 11-digit mobile number starting with 0';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: _passwordTEController,
                          obscureText: _obscureText,
                          // Use a boolean variable to toggle password visibility
                          decoration: InputDecoration(
                            labelText: 'Enter Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText =
                                      !_obscureText; // Toggle the password visibility
                                });
                              },
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors
                                    .grey, // Customize the icon color as needed
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: _donationController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Enter Your Last Donation',
                            suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2050),
                                );

                                if (pickedDate != null &&
                                    pickedDate != _donationController.text) {
                                  setState(() {
                                    _donationController.text =
                                        "${pickedDate.toLocal()}".split(' ')[0];
                                  });
                                }
                              },
                              icon: const Icon(Icons.calendar_today,
                                  color: Colors.grey),
                            ),
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                        const SizedBox(height: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('Weight over 50 kg?'),
                                const Spacer(),
                                Checkbox(
                                  activeColor: Colors.red.shade800,
                                  checkColor: Colors.white,
                                  value: _weightOver50Controller,
                                  onChanged: (value) {
                                    setState(() {
                                      _weightOver50Controller = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            if (!_weightOver50Controller)
                              const Text(
                                  'Please confirm that your weight is over 50 kg',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12))
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        GetBuilder<SignUpController>(
                            builder: (signUpController) {
                          return Visibility(
                            visible: signUpController.signUpInProgress == false,
                            replacement: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            child: ElevatedButton(
                              onPressed: _registration,
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Have an account?",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offAll(const LoginScreen());
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const LoginScreen()));
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ))),
      ),
    );
  }

  Future<void> _registration() async {
    if (_formKey.currentState!.validate()) {
      final response = await _signUpController.registration(
          _usernameTEController.text.trim(),
          _mobileNumberTEController.text.trim(),
          _emailTEController.text.trim(),
          _donationController.text,
          selectedBloodGroup,
          _weightOver50Controller.toString(),
          _donationController.text,
          _passwordTEController.text);
      if (mounted) {
        _clearTextFields();
        showSnackMessage(context, _signUpController.failureMessage);
      }
    }
  }

  void _clearTextFields() {
    _usernameTEController.clear();
    _postOfficeTEController.clear();
    _emailTEController.clear();
    _dobController.clear();
    _mobileNumberTEController.clear();
    _passwordTEController.clear();
    _donationController.clear();
  }

  @override
  void dispose() {
    _usernameTEController.dispose();
    _postOfficeTEController.dispose();
    _emailTEController.dispose();
    _dobController.dispose();
    _mobileNumberTEController.dispose();
    _passwordTEController.dispose();
    _donationController.dispose();
    super.dispose();
  }
}
