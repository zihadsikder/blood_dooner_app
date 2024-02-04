import 'dart:convert';
import 'dart:developer';
import 'package:blood/presentation/state_holders/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'network_response.dart';

class NetworkCaller {
  AuthController auth = Get.find<AuthController>();

  Future<NetworkResponse> postRequest(String url,
      {Map<String, dynamic>? body, String? token}) async {
    try {
      log(url);
      log(body.toString());
      final response =
          await post(Uri.parse(url), body: jsonEncode(body), headers: {
        'Authorization': auth.model?.data != null
            ? "Bearer ${auth.model!.data.accessToken}"
            : "",
        'Content-Type': 'application/json'
      });
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          jsonResponse: response.body,
          statusCode: 200,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> getRequest(String url, {String? token}) async {
    try {
      log(url);
      log(token.toString());
      final response = await get(Uri.parse(url), headers: {
        'Content-type': 'Application/json',
        'Authorization': auth.model?.data != null
            ? "Bearer ${auth.model!.data.accessToken}"
            : "",
      });
      log(response.headers.toString());
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          isSuccess: true,
          jsonResponse: response.body,
          statusCode: 200,
        );
      } else if (response.statusCode == 401) {
        //backToLogin();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: jsonDecode(response.body),
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          jsonResponse: response.body,
        );
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, errorMessage: e.toString());
    }
  }
}

