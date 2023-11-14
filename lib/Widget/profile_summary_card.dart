
import 'package:flutter/material.dart';

import '../screens/ac_info.dart';

class ProfileSummaryCard extends StatefulWidget {
  const ProfileSummaryCard({super.key,});

  @override
  State<ProfileSummaryCard> createState() => _ProfileSummaryCardState();
}

class _ProfileSummaryCardState extends State<ProfileSummaryCard> {
  //final bool enableOnTap;
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
              builder: (context) => const Ac_Info(),
            ),
          );
        // if (enableOnTap) {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const EditProfileScreen(),
        //     ),
        //   );
        // }
      },
      leading:  CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text('Zihad',
        //fullName,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
      subtitle: Text('zihad@gmail.com',
       // AuthController.user?.email ?? '',
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: (){},
        // onPressed: () async {
        //   await AuthController.clearAuthData();
        //   // TODO : solve this warning
        //   Navigator.pushAndRemoveUntil(
        //       context, MaterialPageRoute(builder: (context) => const LoginScreen()), (
        //       route) => false);
        // },
        icon: const Icon(Icons.logout,color: Colors.white,),
      ),
      tileColor: Colors.red.shade800,
    );
  }

  // String get fullName {
  //   return '${AuthController.user?.firstName ?? ''} ${AuthController.user?.lastName ?? ')'}';
  }
