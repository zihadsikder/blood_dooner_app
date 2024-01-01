import 'package:blood/data/network_caller/network_caller.dart';
import 'package:blood/data/network_caller/network_response.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:blood/model/address_response/District_responce.dart';
import 'package:blood/model/address_response/division_response.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  final RxBool isLoading = true.obs;

  String _failMessage = '';
  String get failureMessage => _failMessage;

  DivisionResponse? divisionList;
  String? selectedDivisionName;
  get selectedDivision => null;

  MDistrictResponse? districtList;
  String? selectedDistrictName;
  get selectedDistrict => null;




  @override
  void onInit() {
    super.onInit();
    getDivision();
  }
  Future<void> getDivision() async {
    isLoading.value = true;
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getDivisionData);
    if (response.isSuccess) {
      divisionList = divisionFromJson(response.jsonResponse!);
    } else {
      // Handle error here
    }

    isLoading.value = false;
  }

  Future<void> getDistrict({required String id}) async {
    isLoading.value = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getDistrictData + id);
    if (response.isSuccess) {
      districtList = mDistrictResponseFromJson(response.jsonResponse!);
      update(); // Trigger a rebuild
    } else {
      _failMessage = ('Account creation failed! Please try again.');
    }

    isLoading.value = false;
  }
}
