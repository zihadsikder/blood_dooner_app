import 'package:blood/data/model/registration_params.dart';
import 'package:blood/data/network/network_caller.dart';
import 'package:blood/data/network/network_response.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final _signUpInProgress = false.obs;

  bool get signUpInProgress => _signUpInProgress.value;

  String _failMessage = '';
  String get failureMessage => _failMessage;

  Future<bool> registration(RegistrationParams params) async {
    _signUpInProgress.value = true;
    update();

    final NetworkResponse response = await NetworkCaller().postRequest(
      Urls.registration,
      body: params.toJson(),
    );

    _signUpInProgress.value = false;

    if (response.isSuccess) {
      _failMessage = ('Account has been created! Please Sign In.');
      update();
      return true;
    }
    else {
      _failMessage = ('Account creation failed! Please try again.');
      update();
      return false;
    }
  }
}
