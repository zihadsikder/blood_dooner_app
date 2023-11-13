import 'Widget/location_from.dart';
import 'main_page.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _weightOver50Controller = TextEditingController();
  final TextEditingController _donationController = TextEditingController();

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
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
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
                  controller: _emailController,
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
                          color: Colors.red.shade900),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _mobileNumberController,
                  decoration: InputDecoration(
                    labelText: 'Enter Valid Number',
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
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
                  controller: _confirmPasswordController,
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
                          color: Colors.red.shade900),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateFields() {
    // Check if all fields are valid before allowing submission
    if (_usernameController.text.isNotEmpty &&
        selectedBloodGroup.isNotEmpty &&
        selectedDivision != 'Select Division' &&
        selectedDivision != 'Select District' &&
        _isValidEmail(_emailController.text) &&
        _isValidPassword(_passwordController.text) &&
        _isValidConfirmPassword(
            _passwordController.text, _confirmPasswordController.text) &&
        _isValidMobileNumber(_mobileNumberController.text) &&
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
}
