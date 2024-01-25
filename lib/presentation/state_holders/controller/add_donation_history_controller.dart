import 'package:blood/data/network/network_caller.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:get/get.dart';

class DonationHistoryController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<bool> addDonation( String place, String date) async {
    _inProgress = true;
    update();


    final response = await NetworkCaller().postRequest(
      Urls.storeDonationHistory,
      body: {
        "donation_place": place,
        "donation_date": date,
      },
    );
    _inProgress = false;
    if (response.isSuccess) {
      place;
      date;
      update();
       _errorMessage = ('New History added!');
      return true;
    } else {
      update();
      _errorMessage = 'Add Donation Fail!';
      return false;
    }
  }
}

