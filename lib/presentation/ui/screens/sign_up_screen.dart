import 'package:blood/data/model/registration_params.dart';
import 'package:blood/presentation/state_holders/controller/location_controller.dart';
import 'package:blood/presentation/state_holders/controller/sign_up_controller.dart';
import 'package:blood/presentation/ui/Widget/snack_message.dart';
import 'package:get/get.dart';
import '../Widget/location_from.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameTEController = TextEditingController();
  final TextEditingController _mobileNumberTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final LocationController locationController = Get.find<LocationController>();


  bool _weightOver50Controller = false;
  bool _obscureText = true;

  String selectedBloodGroup = '';
  String selectedDivision = '';
  String selectedDistrict= '';
  String selectedUpzila= '';
  String selectedUnion= '';

  // late final String selectedDivision;
  // late final String selectedDistrict;
  // late final String selectedUpzila;
  // late final String selectedUnion;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
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
                            if (value
                                ?.trim()
                                .isEmpty ?? true) {
                              return 'Enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        LocationFormScreen(
                          selectedBloodGroup: selectedBloodGroup,
                          selectedDivision: locationController.selectedDivisionName ?? '',
                          selectedDistrict: locationController.selectedDistrictName ?? '',
                          selectedUpzila: locationController.selectedUpzilaName ?? '',
                          selectedUnion: locationController.selectedUnionName ?? '',
                          onBloodGroupSelected: (bloodGroup) {
                            setState(() {
                              selectedBloodGroup = bloodGroup;
                            });
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
                          controller: _mobileNumberTEController,
                          decoration: const InputDecoration(
                            labelText: 'Mobile',
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (String? value) {
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
                            if (value
                                ?.trim()
                                .isEmpty ?? true) {
                              return 'Enter your Date of Birth';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8.0),
                        TextFormField(
                          controller: _passwordTEController,
                          obscureText: _obscureText,
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
                            if (value
                                ?.trim()
                                .isEmpty ?? true) {
                              return 'Enter your password';
                            }
                            return null;
                          },
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
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        final registrationParams = RegistrationParams(
                                          name: _usernameTEController.text.trim(),
                                          mobile: _mobileNumberTEController.text.trim(),
                                          email: _emailTEController.text.trim(),
                                          dob: _dobController.text,
                                          blood: selectedBloodGroup,
                                          weight: _weightOver50Controller.toString(),
                                          password: _passwordTEController.text,
                                          address: Address(
                                            divisionId: locationController.selectedDivisionName ?? '',
                                            districtId: locationController.selectedDistrictName?? '',
                                            areaId: locationController.selectedUpzilaName ?? '',
                                            postOffice: locationController.selectedUnionName ?? '',
                                          ),
                                        );
                                        final bool result =
                                        await signUpController.registration (
                                            registrationParams);
                                        if (result) {
                                           showSnackMessage(context, signUpController.failureMessage);
                                          _clearTextFields();
                                          Get.to(() => const LoginScreen());
                                        } else {
                                          Get.showSnackbar(GetSnackBar(
                                            title: 'Complete profile failed',
                                            message: signUpController.failureMessage,
                                            duration: const Duration(seconds: 2),
                                            isDismissible: true,
                                          ));
                                        }
                                      }
                                    },
                                    child: const Text('Submit'),
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
                            Text(
                              "Have an account?",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offAll(const LoginScreen());
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

  void _clearTextFields() {
    _usernameTEController.clear();
    _emailTEController.clear();
    _dobController.clear();
    _mobileNumberTEController.clear();
    _passwordTEController.clear();

  }

  @override
  void dispose() {
    _usernameTEController.dispose();
    _emailTEController.dispose();
    _dobController.dispose();
    _mobileNumberTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
