import 'package:blood/data/network_caller/network_caller.dart';
import 'package:blood/data/network_caller/network_response.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  bool _signUpInProgress = false;
  String _failMessage = '';

  bool get signUpInProgress => _signUpInProgress;
  String get failureMessage => _failMessage;

  Future<bool> registration(String name, String mobile, String email, String dob, String blood, String weight, String donation, String password ) async {
      _signUpInProgress = true;
      update();
      final NetworkResponse response =
      await NetworkCaller().postRequest(Urls.registration, body: {
        "name": name,
        "mobile": mobile,
        "email": email,
        "dob": dob,
        "blood_group": blood,
        "is_weight_50kg": weight,
        "last_donation": donation,
        "address": {
          "division_id": 1,
          "district_id": 1,
          "area_id": 1,
          "post_office": 1,
        },
        "password": password,
      });
      _signUpInProgress = false;
      update();
      if (response.isSuccess) {
       _failMessage = ('Account has been created! Please login.');
      } else {
        _failMessage = ('Account creation failed! Please try again.');
      }
      return false;
  }
}