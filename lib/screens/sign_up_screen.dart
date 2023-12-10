import 'package:blood/screens/login.dart';

import '../Widget/location_from.dart';

import 'package:flutter/material.dart';

import '../Widget/snack_message.dart';
import '../data/network_caller/network_caller.dart';
import '../data/network_caller/network_response.dart';
import '../data/utility/urls.dart';
import 'main_page.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameTEController = TextEditingController();
  final TextEditingController _mobileNumberTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _weightOver50Controller = TextEditingController();
  final TextEditingController _donationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _signUpInProgress = false;

  bool areFieldsValid = false;
  String selectedBloodGroup = 'A+';
  String selectedDivision = 'Select Division';
  String selectedDistrict = '';
  String selectedThana ='';

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
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: w,
                    height: h * 0.3,
                    decoration: BoxDecoration(
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
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Location(
                    selectedBloodGroup: selectedBloodGroup,
                    selectedDivision: selectedDivision,
                    selectedDistrict: selectedDistrict,
                    selectedThana: selectedThana,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  SizedBox(height: 16.0),
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
                        icon: Icon(Icons.calendar_today,
                            color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _mobileNumberTEController,
                    decoration: InputDecoration(
                      labelText: 'Enter Phone Number',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 16.0),
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
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color:
                              Colors.grey, // Customize the icon color as needed
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _confirmPasswordTEController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText =
                                !_obscureText; // Toggle the password visibility
                          });
                        },
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color:
                              Colors.grey, // Customize the icon color as needed
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 16.0),
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
                        icon: Icon(Icons.calendar_today,
                            color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Text('Weight over 50 kg?'),
                      Spacer(),
                      Checkbox(
                        activeColor: Colors.red.shade800,
                        checkColor: Colors.white,
                        value: _weightOver50Controller.text.toLowerCase() == 'yes',
                        onChanged: (value) {
                          setState(() {
                            _weightOver50Controller.text =
                                value == true ? 'Yes' : 'No';
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _validateFields,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
          ]
          ),
            )
          )
        ),
      ),
    );
  }

  void _validateFields() {
    // Check if all fields are valid before allowing submission
    if (_usernameTEController.text.isNotEmpty &&
        selectedBloodGroup.isNotEmpty &&
        selectedDivision != 'Select Division' &&
        selectedDivision != 'Select District' &&
        _isValidEmail(_emailTEController.text) &&
        _isValidPassword(_passwordTEController.text) &&
        _isValidConfirmPassword(
            _passwordTEController.text, _confirmPasswordTEController.text) &&
        _isValidMobileNumber(_mobileNumberTEController.text) &&
        _isValidDateOfBirth(_dobController.text) &&
        _weightOver50Controller.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Mainpage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all required fields.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  bool _isValidEmail(String email) {
    // Implement your email validation logic here
    // Example: Check if email contains '@' and '.'
    return email.contains('@') && email.contains('.');
  }

  bool _isValidPassword(String password) {
    // Implement your password validation logic here
    // Example: Check if password has a minimum length
    return password.length >= 6;
  }

  bool _isValidConfirmPassword(String password, String confirmPassword) {
    // Implement your confirm password validation logic here
    // Example: Check if password and confirm password match
    return password == confirmPassword;
  }

  bool _isValidMobileNumber(String mobileNumber) {
    // Implement your mobile number validation logic here
    // Example: Check if mobile number starts with '+'
    return mobileNumber.startsWith('+');
  }

  bool _isValidDateOfBirth(String dob) {
    // Implement your date of birth validation logic here
    // Example: Check if dob has the format dd/mm/year
    // You can use a regular expression for this validation
    final dobPattern = r'^\d{2}/\d{2}/\d{4}$';
    return RegExp(dobPattern).hasMatch(dob);

  }
  // Future<void> _signUp() async {
  //   if (_formKey.currentState!.validate()) {
  //     _signUpInProgress = true;
  //     if (mounted) {
  //       setState(() {});
  //     }
  //     final NetworkResponse response =
  //     await NetworkCaller()
  //         .postRequest(Urls.registration, body: {
  //       "firstName": _usernameTEController.text.trim(),
  //
  //       "email" : _emailTEController.text.trim(),
  //       "password" : _passwordTEController.text,
  //       "mobile": _mobileNumberTEController.text.trim(),
  //     });
  //     _signUpInProgress = false;
  //     if (mounted) {
  //       setState(() {});
  //     }
  //     if (response.isSuccess) {
  //       _clearTextFields();
  //       if (mounted) {
  //         showSnackMessage(context, 'Account has been created! Please login.');
  //       }
  //     } else {
  //       if (mounted) {
  //         showSnackMessage(
  //             context,
  //             'Account creation failed! Please try again.',
  //             true);
  //       }
  //     }
  //   }
  // }
  //
  // void _clearTextFields() {
  //   _emailTEController.clear();
  //   _usernameTEController.clear();
  //   _mobileNumberTEController.clear();
  //   _passwordTEController.clear();
  // }
  //
  // @override
  // void dispose() {
  //   _emailTEController.dispose();
  //   _usernameTEController.dispose();
  //   _mobileNumberTEController.dispose();
  //   _passwordTEController.dispose();
  //   super.dispose();
  // }
}
