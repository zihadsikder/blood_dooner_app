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
import 'package:blood/data/utility/urls.dart';
import 'package:get/get.dart';

class DonationHistoryController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<Donation> _donationList = [];
  List<Donation> get donationList => _donationList;

  Future<bool> addDonation(String date, String place) async {
    _inProgress = true;
    update();

    final response = await NetworkCaller().postRequest(
      Urls.storeDonationHistory,
      body: {
        "donation_date": date,
        "donation_place": place,
      },
    );

    _inProgress = false;

    if (response.isSuccess) {
      _donationList.add(Donation(place: place, date: date));
      update();
      return true;
    } else {
      _errorMessage = 'Add Donation Fail!';
      update();
      return false;
    }
  }
}

class Donation {
  String place;
  String date;

  Donation({
    required this.place,
    required this.date,
  });
}