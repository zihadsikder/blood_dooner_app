import 'package:blood/screens/login.dart';
import '../Widget/location_from.dart';
import 'package:flutter/material.dart';
import '../Widget/snack_message.dart';
import '../data/network_caller/network_caller.dart';
import '../data/network_caller/network_response.dart';
import '../data/utility/urls.dart';

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
  bool _weightOver50Controller = false;
  final TextEditingController _donationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _signUpInProgress = false;
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
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _postOfficeTEController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'posy office',
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your post office';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _emailTEController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
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
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _mobileNumberTEController,
                          decoration: const InputDecoration(
                            labelText: 'Mobile',
                          ),
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter your phone number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 16.0),
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
                        const SizedBox(height: 16.0),
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
                        const SizedBox(height: 16.0),
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
                        const SizedBox(height: 16.0),
                        Visibility(
                          visible: _signUpInProgress == false,
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
                        ),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
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
  // int parseDivisionId(String selectedDivision) {
  //   if (selectedDivision == 'Select Division') {
  //     // Handle the case where 'Select Division' is selected
  //     // You can return a default value or handle it as needed
  //     return -1; // Or any other default value
  //   } else {
  //     // Parse the selected division as an integer
  //     return int.parse(selectedDivision);
  //   }
  // }
  Future<void> _registration() async {
    if (_formKey.currentState!.validate()) {
      _signUpInProgress = true;
      if (mounted) {
        setState(() {});
      }

      // Format date values
      String dob = _dobController.text;
      String lastDonation = _donationController.text;

      final NetworkResponse response =
          await NetworkCaller().postRequest(Urls.registration, body: {
        "name": _usernameTEController.text.trim(),
        "mobile": _mobileNumberTEController.text.trim(),
        "email": _emailTEController.text.trim(),
        "dob": dob,
        "blood_group": selectedBloodGroup,
        "is_weight_50kg": _weightOver50Controller.toString(),
        "last_donation": lastDonation,
        // "address": {
        //   "division_id": parseDivisionId(selectedDivision), // Convert to int
        //   "district_id": int.parse(selectedDistrict),  // Convert to int
        //   "area_id": int.parse(selectedThana),  // Convert to int
        //   "post_office": _postOfficeTEController.text.trim(),
        // },
            "address": {
              "division_id": 1,
              "district_id": 1,
              "area_id": 1,
              "post_office": 1,
            },
        "password": _passwordTEController.text
      });

      _signUpInProgress = false;
      if (mounted) {
        setState(() {});
      }

      if (response.isSuccess) {
        _clearTextFields();
        if (mounted) {
          showSnackMessage(context, 'Account has been created! Please login.');
        }
      } else {
        if (mounted) {
          showSnackMessage(
            context,
            'Account creation failed! Please try again.',
            true,
          );
        }
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
