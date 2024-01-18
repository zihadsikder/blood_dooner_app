import 'package:blood/presentation/state_holders/controller/location_controller.dart';
import 'package:blood/presentation/state_holders/controller/login_controller.dart';
import 'package:blood/presentation/state_holders/controller/sign_up_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(SignUpController());
    Get.put(LocationController());
  }
}
