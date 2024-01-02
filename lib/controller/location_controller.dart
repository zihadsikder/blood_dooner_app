import 'package:blood/data/network_caller/network_caller.dart';
import 'package:blood/data/network_caller/network_response.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:blood/model/address_response/District_responce.dart';
import 'package:blood/model/address_response/division_response.dart';
import 'package:blood/model/address_response/union_response.dart';
import 'package:blood/model/address_response/upzila_response.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  bool isLoading = true;

  String _failMessage = '';
  String get failureMessage => _failMessage;

  DivisionResponse? divisionList;
  String? selectedDivisionName;
  //get selectedDivision => null;

  MDistrictResponse? districtList;
  String? selectedDistrictName;
  //get selectedDistrict => null;

  UpzilaResponse? upzilaList;
  String? selectedUpzilaName;
  //get selectedUpzila => null;

  MUnionResponse? unionList;
  String? selectedUnionName;
  //get selectedUnion => null;





  @override
  void onInit() {
    super.onInit();
    getDivision();
  }
  Future<void> getDivision() async {
    isLoading = true;
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getDivisionData);
    if (response.isSuccess) {
      divisionList = divisionFromJson(response.jsonResponse!);
      update();
    } else {
      _failMessage = ('An error occurred while fetching Division data.');
    }

    isLoading = false;
    update();
  }

  Future<void> getDistrict({required String id}) async {
    isLoading = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getDistrictData + id);
    //print('===============: : : ${response.isSuccess} from district');
    districtList = mDistrictResponseFromJson(response.jsonResponse!);
    update();
    if (response.isSuccess) {
      districtList = mDistrictResponseFromJson(response.jsonResponse!);
      update(); // Trigger a rebuild
    } else {
      _failMessage = ('An error occurred while fetching District data.');
    }

    isLoading = false;
    update();
  }

  Future<void> getUpzila({required String id}) async {
    try {
      final NetworkResponse response = await NetworkCaller().getRequest(Urls.getUpzilaData + id);
      print('===============: : : ${response.isSuccess} from upzila');
      upzilaList = upzilaResponseFromJson(response.jsonResponse!);
      update();

      if (response.isSuccess) {
        upzilaList = upzilaResponseFromJson(response.jsonResponse!);
        update(); // Trigger a rebuild
      } else {
        _failMessage = ('Upzila data fetch failed! Please try again.');
      }
    }
    catch (e) {
      print('Error fetching upzila data: $e');
      _failMessage = ('An error occurred while fetching upzila data.');
    }
    finally {
      isLoading = false;
      update(); // Trigger a rebuild
    }
  }


// Future<void> getUnion({required String id}) async {
  //   isLoading = true;
  //   update();
  //   final NetworkResponse response = await NetworkCaller().getRequest(Urls.getUnionData + id);
  //   //print('===============: : : ${response.isSuccess} from district');
  //   unionList = mUnionResponseFromJson(response.jsonResponse!);
  //   update();
  //   if (response.isSuccess) {
  //     unionList = mUnionResponseFromJson(response.jsonResponse!);
  //     update(); // Trigger a rebuild
  //   } else {
  //     _failMessage = ('Account creation failed! Please try again.');
  //   }
  //
  //   isLoading = false;
  // }
}
