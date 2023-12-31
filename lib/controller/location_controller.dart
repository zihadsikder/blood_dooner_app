import 'package:blood/data/network_caller/network_caller.dart';
import 'package:blood/data/network_caller/network_response.dart';
import 'package:blood/data/utility/urls.dart';
import 'package:blood/model/address_response/division_response.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList<Datum> divisionList = <Datum>[].obs;

  get selectedDivision => null;

  @override
  void onInit() {
    super.onInit();
    getDivision();
  }

  Future<void> getDivision() async {
    isLoading.value = true;
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getDivisionData);

    if (response.isSuccess) {
      final DivisionResponse divisionResponse = DivisionResponse.fromJson(response.jsonResponse as Map<String, dynamic>);
      divisionList.assignAll(divisionResponse.data);
    } else {
      // Handle error here
    }

    isLoading.value = false;
  }
}
