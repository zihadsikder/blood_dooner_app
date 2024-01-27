import 'package:blood/data/model/search_user_model.dart';
import 'package:blood/data/network/network_caller.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:get/get.dart';

class SearchBloodDonorController extends GetxController {
  MSearchUserModel? user;
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> searchDonor(String bloodGroup, String division, String district,
      String upzila, String postOffice) async {
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest("${Urls.getSearchDonor}"
        "blood_group=$bloodGroup"
        "&division_id=$division"
        "&district_id=$district"
        "&area_id=$upzila"
        "&post_office=$postOffice");

    _inProgress = false;

    if (response.isSuccess) {
      user = mSearchUserModelFromJson(response.jsonResponse!);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
