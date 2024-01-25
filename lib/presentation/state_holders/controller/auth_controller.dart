import 'dart:convert';
import 'package:blood/data/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  String? token;
  UserModel? model;

  Future<void> saveUserInformation(String t, UserModel profile) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', t);
    await sharedPreferences.setString('model', jsonEncode(profile.toJson()));
    token = t;
    model = profile;
  }

  Future<void> initialize() async {
    token = await _getToken();
    model = await _getUser();
  }

  Future<bool> isLoggedIn() async {
    await initialize();
    return token != null;
  }

  Future<String?> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

  Future<UserModel?> _getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? strUserModel = sharedPreferences.getString('model');
    if (strUserModel == null) {
      return null;
    } else {
      return UserModel.fromJson(jsonDecode(strUserModel));
    }
  }

  Future<bool> checkAuthState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    if (token != null) {
      await initialize();
      return true;
    }
    return false;
  }

  Future<void> clearAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  String? getAccessToken() {
    return token;
  }
}

// Future<void> initializeUserCache() async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   var token = sharedPreferences.getString('token');
//   var user = UserModel.fromJson(jsonDecode(sharedPreferences.getString('user') ?? '{}'));
// }
