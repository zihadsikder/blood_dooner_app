import 'package:blood/controller/auth_controller.dart';
import 'package:blood/screens/account_screen.dart';
import 'package:blood/screens/login.dart';
import 'package:flutter/material.dart';

class ProfileSummaryCard extends StatefulWidget {
  const ProfileSummaryCard({
    super.key,
    this.enableOnTap = true,
  });

  final bool enableOnTap;

  @override
  State<ProfileSummaryCard> createState() => _ProfileSummaryCardState();
}

class _ProfileSummaryCardState extends State<ProfileSummaryCard> {

  @override
  Widget build(BuildContext context) {
    print('name: ${AuthController.user?.name}');

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      onTap: () {
        if (widget.enableOnTap) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AccountScreen(),
            ),
          );
        }
      },
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(
        AuthController.user?.name?? 'name',
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        AuthController.user?.email ?? 'email',
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () async {
          await AuthController.clearAuthData();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false);
        },
        icon: const Icon(Icons.logout, color: Colors.white),
      ),
      tileColor: Colors.red.shade900,
    );
  }
}
