import 'package:blood/data/model/user_model.dart';
import 'package:blood/data/network/network_caller.dart';
import 'package:blood/data/network/network_response.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:blood/presentation/state_holders/controller/auth_controller.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _loginInProgress = false.obs;

  String _failMessage = '';

  bool get loginInProgress => _loginInProgress.value;

  String get failureMessage => _failMessage;

  Future<bool> login(String mobile, String password) async {
    _loginInProgress.value = true;
    update();

    final NetworkResponse response = await NetworkCaller().postRequest(Urls.login,
        body: {"mobile": mobile, "password": password},);
    _loginInProgress.value = false;

    if (response.isSuccess && response.jsonResponse != null) {
      //print("${response.isSuccess} ${response.jsonResponse} =================");
      UserModel user = userModelFromJson(response.jsonResponse!);
      // print("saved token ::: ${user.data.accessToken}");
      Get.find<AuthController>().saveUserInformation(user.data.accessToken, user);
      _failMessage = ('Login Successfully');
      update();
      return true;
    } else {
        _failMessage = ('Login failed. Try again');
        update();
        return false;
    }
  }
}
