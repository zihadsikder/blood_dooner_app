// import 'package:blood/data/network_caller/network_caller.dart';
// import 'package:blood/data/utility/urls.dart';
// import 'package:get/get.dart';
//
// class DonationHistoryController extends GetxController{
//
//   bool _inProgress = false;
//
//   bool get inProgress => _inProgress;
//   String _errorMessage = '';
//
//   String get errorMessage => _errorMessage;
//
//   Future<bool> addDonation(String? date, String place) async {
//     _inProgress = true;
//     update();
//     final response = await NetworkCaller().postRequest(Urls.storeDonationHistory, body: {
//       "donation_date": date,
//       "donation_place": place
//     });
//     _inProgress = false;
//     if(response.isSuccess){
//       update();
//       return true;
//     }else{
//       _errorMessage = ('Add Donation Fail!');
//       update();
//       return false;
//
//     }
//   }
//
//
//
// }
import 'package:blood/data/network_caller/network_caller.dart';
import 'package:blood/data/network_caller/network_response.dart';
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
    final NetworkResponse response = await NetworkCaller().postRequest(
      Urls.storeDonationHistory,
      body: {
        "donation_place": place,
        "donation_date": date,
      },
    );
    _inProgress = false;

    if (response.isSuccess) {
       // place;
       // date;
       _errorMessage = ('New History added!');
       update();
      return true;

    } else {
      _errorMessage = 'Add Donation Fail!';
      update();
      return false;
    }
  }
}

