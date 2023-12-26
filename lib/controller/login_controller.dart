import 'package:blood/controller/auth_controller.dart';
import 'package:blood/data/network_caller/network_caller.dart';
import 'package:blood/data/network_caller/network_response.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:blood/model/user_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  bool _loginInProgress = false;
  String _failMessage = '';

  bool get loginInProgress => _loginInProgress;
  String get failureMessage => _failMessage;
  Future<bool> login(String mobile, String password) async {
    _loginInProgress = true;
    update();
    NetworkResponse response =
    await NetworkCaller().postRequest(Urls.login, body: {
      "mobile": mobile,
      'password': password,
    });
    _loginInProgress = false;
    update();
    if (response.isSuccess) {
       AuthController.saveUserInformation(response.jsonResponse?['token'],
          UserModel.fromJson(response.jsonResponse?['data']));
    } else {
      if (response.statusCode == 401) {
        _failMessage = ('Please check email/password');
      } else {
        _failMessage = ('Login failed. Try again');
      }
    }
    return false;
  }
}