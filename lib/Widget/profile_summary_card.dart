import 'package:blood/controller/auth_controller.dart';
import 'package:blood/screens/account_screen.dart';
import 'package:blood/screens/login.dart';
import 'package:flutter/material.dart';


class ProfileSummaryCard extends StatefulWidget {
  const ProfileSummaryCard({super.key,});

  @override
  State<ProfileSummaryCard> createState() => _ProfileSummaryCardState();
}

class _ProfileSummaryCardState extends State<ProfileSummaryCard> {
  //late final bool enableOnTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Account_Screen (),
            ),
          );
      //   if (enableOnTap) {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const AcInformation(),
      //       ),
      //     );
      //   }
      },
      leading:  const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: const Text('Zihad',
        //fullName,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: const Text('zihad@gmail.com',
       // AuthController.user?.email ?? '',
        style: TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () async {
          await AuthController.clearAuthData();
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => const LoginScreen()), (
              route) => false);
        },
        icon: const Icon(Icons.logout,color: Colors.white,),
      ),
      tileColor: Colors.red.shade900,
    );
  }

  // String get fullName {
  //   return '${AuthController.user?.firstName ?? ''} ${AuthController.user?.lastName ?? ')'}';
  }
