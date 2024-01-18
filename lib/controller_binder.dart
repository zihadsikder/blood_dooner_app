import 'package:get/get.dart';

import 'controller/location_controller.dart';
import 'controller/login_controller.dart';
import 'controller/sign_up_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(SignUpController());
    Get.put(LocationController());
  }
}
