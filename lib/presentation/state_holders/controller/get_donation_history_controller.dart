import 'package:blood/data/model/donor_lhistory_list_model.dart';
import 'package:blood/data/network_caller/network_caller.dart';
import 'package:blood/data/network_caller/network_response.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:get/get.dart';

class GetDonationHistoryController extends GetxController{

  DonorHistoryList _donorHistoryList = DonorHistoryList();

  DonorHistoryList get donorHistoryList => _donorHistoryList;

  bool _inProgress = false;

  bool get inProgress => _inProgress;


  Future<bool> getDonationList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getDonorList);
    _inProgress = false;

    if (response.isSuccess) {
      _donorHistoryList = donorHistoryListFromJson(response.jsonResponse!);
      isSuccess = true;
      update();
    } else {
      update();
    }
    return isSuccess;
  }

}
