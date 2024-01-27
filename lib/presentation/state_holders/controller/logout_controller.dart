import 'package:blood/data/network/network_caller.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController{

  bool _logoutInProgress = false;

  bool get logoutInProgress => _logoutInProgress;

  Future<bool> logout() async {
    _logoutInProgress = true;
    update();

    final response = await NetworkCaller().postRequest(Urls.logout, body: {});
    _logoutInProgress = false;
    if(response.isSuccess){
      update();
      return true;
    }else{
      update();
      return false;
    }
  }
}