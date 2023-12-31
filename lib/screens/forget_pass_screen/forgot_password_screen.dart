import 'package:blood/Widget/app_logo.dart';
import 'package:blood/screens/forget_pass_screen/pin_varification_screen.dart';
import 'package:flutter/material.dart';

import '../../Widget/body_background.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80,),
                  const Center(child: AppLogo()),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Your Email Address',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'A 6 digit OTP will be sent to your email address',
                    style: Theme.of(context).textTheme.bodySmall
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
    // onPressed: () async{
    //
    // String val = emailInputController.text.trim();
    //
    // if(val.isEmpty){
    // showSnackMessage(context, 'enter a valid email', true);
    // return;
    // }
    //
    // //widget.showProgress(true);
    // final response = await NetworkCaller()
    //     .getRequest('${Urls.recoveryVerifyEmail}/$val');
    // if (response.isSuccess) {
    //
    // Navigator.push(
    // context,
    // MaterialPageRoute(
    // builder: (context) =>  PinVerificationScreen(email: val,),
    //
    // ),
    // );
    // }else{
    // showSnackMessage(context, 'Error : ${response.statusCode}', true);
    // return;
    // }
    // // widget.showProgress(false);
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PinVerificationScreen(),
                          ),
                        );
                      },
                      child: const Icon(Icons.arrow_circle_right_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an account?", style:Theme.of(context).textTheme.bodySmall ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(fontSize: 16),
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
    );
  }
}