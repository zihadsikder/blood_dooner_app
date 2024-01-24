import 'package:blood/presentation/state_holders/controller/auth_controller.dart';
import 'package:blood/presentation/state_holders/controller/get_donation_history_controller.dart';
import 'package:blood/presentation/state_holders/controller/location_controller.dart';
import 'package:blood/presentation/state_holders/controller/login_controller.dart';
import 'package:blood/presentation/state_holders/controller/search_blood_donor_controller.dart';
import 'package:blood/presentation/state_holders/controller/sign_up_controller.dart';
import 'package:get/get.dart';

import 'presentation/state_holders/controller/add_donation_history_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(SignUpController());
    Get.put(LocationController());
    Get.put(AuthController());
    Get.put(DonationHistoryController());
    Get.put(SearchBloodDonorController());
    Get.put(GetDonationHistoryController());
  }
}
