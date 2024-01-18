import 'package:blood/data/model/address_response/District_responce.dart';
import 'package:blood/data/model/address_response/division_response.dart';
import 'package:blood/data/model/address_response/union_response.dart';
import 'package:blood/data/model/address_response/upzila_response.dart';
import 'package:blood/data/network_caller/network_caller.dart';
import 'package:blood/data/network_caller/network_response.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  bool isLoading = true;

  String _failMessage = '';
  String get failureMessage => _failMessage;

  List<Division>? divisionList;
  String? selectedDivisionName;

  List<District>? districtList;
  String? selectedDistrictName;

  List<Upzila>? upzilaList;
  String? selectedUpzilaName;

  List<Union>? unionList;
  String? selectedUnionName;

  @override
  void onInit() {
    super.onInit();
    getDivision();
  }
  Future<void> getDivision() async {
    isLoading = true;
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getDivisionData);
    if (response.isSuccess) {
      divisionList = divisionFromJson(response.jsonResponse!).data;
      update();
    } else {
      _failMessage = ('An error occurred while fetching Division data.');
    }
    isLoading = false;
    update();
  }

  Future<void> getDistrict({required String id}) async {
    isLoading = true;
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getDistrictData + id);

    if (response.isSuccess) {
      districtList = mDistrictResponseFromJson(response.jsonResponse!).data;
      update(); // Trigger a rebuild
    } else {
      _failMessage = ('An error occurred while fetching District data.');
    }
    isLoading = false;
    update();
  }

  Future<void> getUpzila({required String id}) async {
      isLoading = true;
      final NetworkResponse response = await NetworkCaller().getRequest(Urls.getUpzilaData + id);
      if (response.isSuccess) {
        upzilaList = upzilaResponseFromJson(response.jsonResponse!).data;
        update(); // Trigger a rebuild
      } else {
        _failMessage = ('Upzila data fetch failed! Please try again.');
      }
      isLoading = false;
      update(); // Trigger a rebuild
    }



Future<void> getUnion({required String id}) async {
    isLoading = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getUnionData + id);
    if (response.isSuccess) {
      unionList = unionResponseFromJson(response.jsonResponse!).data;
      //print('===============: : : ${unionList?.length} from upzila');
      update(); // Trigger a rebuild
    } else {
      _failMessage = ('Upzila data fetch failed! Please try again.');
    }
    isLoading = false;
    update(); // Trigger a rebuild
}
}
