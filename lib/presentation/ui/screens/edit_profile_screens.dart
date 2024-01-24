import 'package:blood/presentation/state_holders/controller/auth_controller.dart';
import 'package:blood/presentation/ui/Widget/body_background.dart';
import 'package:blood/presentation/ui/Widget/profile_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _emailTEController.text =
        Get.find<AuthController>().model?.data.email ?? '';
    _nameTEController.text = Get.find<AuthController>().model?.data.name ?? '';
    _lastNameTEController.text =
        Get.find<AuthController>().model?.data.email ?? '';
    _mobileTEController.text =
        Get.find<AuthController>().model?.data.name ?? '';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ProfileSummaryCard(
              enableOnTap: false,
            ),
            Expanded(
              child: BodyBackground(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          'Update Profile',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: _emailTEController,
                          decoration: const InputDecoration(hintText: 'Email'),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _nameTEController,
                          decoration:
                              const InputDecoration(hintText: 'First name'),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _lastNameTEController,
                          decoration:
                              const InputDecoration(hintText: 'Last name'),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _mobileTEController,
                          decoration: const InputDecoration(hintText: 'Mobile'),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _passwordTEController,
                          decoration: const InputDecoration(
                              hintText: 'Password (optional)'),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Obx(() {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child:
                                  const Icon(Icons.arrow_circle_right_outlined),
                            ),
                          );
                        }),
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
