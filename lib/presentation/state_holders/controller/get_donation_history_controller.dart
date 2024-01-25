import 'package:blood/data/model/donor_history_list_model.dart';
import 'package:blood/data/network/network_caller.dart';
import 'package:blood/data/network/network_response.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:get/get.dart';

class GetDonationHistoryController extends GetxController{

  DonorHistoryList _donorHistoryList = DonorHistoryList();

  DonorHistoryList get donorHistoryList => _donorHistoryList;

  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> getDonationList() async {
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getDonorList);
    _inProgress = false;
    if (response.isSuccess) {
      _donorHistoryList = donorHistoryListFromJson(response.jsonResponse!);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
