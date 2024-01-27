import 'package:blood/presentation/state_holders/controller/auth_controller.dart';
import 'package:blood/presentation/ui/screens/Accounts/account_screen.dart';
import 'package:blood/presentation/ui/screens/login_screen.dart';
import 'package:blood/presentation/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        Get.find<AuthController>().model?.data.name?? 'name',
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        Get.find<AuthController>().model?.data.email ?? 'email',
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () async {
          await Get.find<AuthController>().clearAuthData();
          Get.to(()=> const SearchScreen());
        },
        icon: const Icon(Icons.search_outlined, color: Colors.white),
      ),
      tileColor: Colors.red.shade900,
    );
  }
}
