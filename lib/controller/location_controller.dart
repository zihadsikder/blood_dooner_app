import 'package:blood/data/utility/urls.dart';
import 'package:get/get.dart';

import '../data/network_caller/network_caller.dart';
import '../data/network_caller/network_response.dart';
import '../model/division_response.dart';

class LocationControler extends GetxController {
  final divisionList = <Datum>[].obs;

  String _failMessage = '';

  String get failureMessage => _failMessage;

  final _locationProgress = false.obs;

  bool get getLocationInProgress => _locationProgress.value;

  final selectedDivision = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> getDivision() async {
    _locationProgress.value = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(
      Urls.getDivisionData,
    );

    _locationProgress.value = false;
    update();
    if (response.isSuccess) {
      DivisionResponse divisionResponse =
          divisionFromJson(response.jsonResponse.toString());

      // for (Datum data in divisionResponse.data) {
      //   divisionList.add(data.name);
      // }

      divisionList.value = divisionResponse.data;

      update();
    } else {
      _failMessage = ('Account creation failed! Please try again.');
    }
    return false;
  }
}
