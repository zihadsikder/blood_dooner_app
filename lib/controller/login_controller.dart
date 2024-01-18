import 'package:blood/controller/auth_controller.dart';
import 'package:blood/data/network_caller/network_caller.dart';
import 'package:blood/data/network_caller/network_response.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:blood/model/user_model.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  final _loginInProgress = false.obs;

  String _failMessage = '';

  bool get loginInProgress => _loginInProgress.value;

  String get failureMessage => _failMessage;

  Future<bool> login(String mobile, String password) async {
    _loginInProgress.value = true;
    update();

    NetworkResponse response = await NetworkCaller().postRequest(Urls.login,
        body: {"mobile": mobile, "password": password});
    _loginInProgress.value = false;
    update();
    if (response.isSuccess && response.jsonResponse != null) {
      UserModel user = userModelFromJson(response.jsonResponse!);
      // print("saved token ::: ${user.data.accessToken}");
      AuthController.saveUserInformation(user.data.accessToken, user);
      return true;
    } else {
      if (response.isSuccess) {
        _failMessage = ('Login Successful');
      } else {
        _failMessage = ('Login failed. Try again');
      }
    }
    return false;
  }
}
