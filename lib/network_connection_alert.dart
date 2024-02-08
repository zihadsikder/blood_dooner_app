import 'package:blood/presentation/state_holders/controller/connectivity_controller.dart';
import 'package:blood/presentation/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectionAlert extends StatefulWidget {
  const ConnectionAlert({super.key});

  @override
  State<ConnectionAlert> createState() => _ConnectionAlertState();
}

class _ConnectionAlertState extends State<ConnectionAlert> {
  final connectivityController = Get.find<ConnectivityController>();

  @override
  void initState() {
    connectivityController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: connectivityController.isConnected,
      builder: (context, value, child) {
        if (value) {
          Get.to(()=>const SplashScreen());
          return const SizedBox();
        } else {
          return Container(
            // You can customize the container to fit your needs
            color: Colors.red,
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              children: [
                Icon(Icons.warning, color: Colors.white),
                SizedBox(width: 8.0),
                Text(
                  'Check Your Internet Connection!',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}


// import 'package:blood/presentation/state_holders/controller/connectivity_controller.dart';
// import 'package:get/get.dart';
//
// class NetworkConnection {
//   static void init(){
//     Get.put<ConnectivityController>(ConnectivityController(),permanent: true);
//   }
// }