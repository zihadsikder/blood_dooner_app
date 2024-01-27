import 'package:blood/data/network/network_caller.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:blood/presentation/state_holders/controller/auth_controller.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  AuthController auth = Get.find<AuthController>();
  bool _logoutInProgress = false;

  bool get logoutInProgress => _logoutInProgress;

  Future<bool> logout() async {
    _logoutInProgress = true;
    update();
    final response = await NetworkCaller().postRequest(Urls.logout, body: {});
    _logoutInProgress = false;
    if (response.isSuccess) {
      auth.clearAuthData();
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
