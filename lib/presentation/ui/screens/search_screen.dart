import 'package:blood/presentation/state_holders/controller/get_donation_history_controller.dart';
import 'package:blood/presentation/state_holders/controller/location_controller.dart';
import 'package:blood/presentation/state_holders/controller/search_blood_donor_controller.dart';
import 'package:blood/presentation/ui/Widget/location_from.dart';
import 'package:blood/presentation/ui/screens/search_result_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final getDonationHistoryController = Get.find<GetDonationHistoryController>();

  final SearchBloodDonorController userController =
  Get.find<SearchBloodDonorController>();
  final LocationController locationController = Get.find<LocationController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String selectedBloodGroup = '' ;

  String get selectedDivision => locationController.selectedDivisionName?? '';
  String get selectedDistrict => locationController.selectedDistrictName?? '';
  String get selectedUpzila => locationController.selectedUpzilaName?? '';
  String get selectedUnion => locationController.selectedUnionName?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find A Blood Donor"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LocationFormScreen(
                  selectedBloodGroup: selectedBloodGroup,
                  selectedDivision: locationController.selectedDivisionName ?? '',
                  selectedDistrict: locationController.selectedDistrictName ?? '',
                  selectedUpzila: locationController.selectedUpzilaName ?? '',
                  selectedUnion: locationController.selectedUnionName ?? '',
                  onBloodGroupSelected: (bloodGroup) {
                    setState(() {
                      selectedBloodGroup = bloodGroup;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<SearchBloodDonorController>(
                      builder: (donorController) {
                        return Visibility(
                          visible: donorController.inProgress == false,
                          replacement: const Center(
                              child: CircularProgressIndicator()),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final bool result =
                                await donorController.searchDonor(
                                  selectedBloodGroup,
                                  selectedDivision,
                                  selectedDistrict,
                                  selectedUpzila,
                                  selectedUnion);
                                if (result) {

                                } else {
                                  Get.showSnackbar(const GetSnackBar(
                                    title: 'Search Donor Fail',
                                    duration: Duration(seconds: 2),
                                    isDismissible: true,
                                    message: 'Try Again',
                                  ));
                                }
                              }
                            },
                            child: const Text(
                              'Search',
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 16.0),
                // Display search results as a ListView
                GetBuilder<SearchBloodDonorController>(builder: (context) {
                  if (userController.user == null || userController.user!.data == null) {
                    return const Text('No search results');
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: userController.user!.data!.length,
                    itemBuilder: (context, index) {
                      String formattedLastDonation = DateFormat('dd-mm-yyyy').format(
                        userController.user!.data![index].lastDonation!.toLocal(),
                      );
                      return SearchResultItem(
                        name: userController.user!.data![index].name ?? '',
                        bloodGroup: userController.user!.data![index].bloodGroup ?? '',
                        lastDonation: formattedLastDonation,
                        totalDonations: getDonationHistoryController.donorHistoryList.data?.length.toString() ?? '',
                        // totalDonations: userController.user!.data![index].mobile?.toString() ?? '',
                        mobile: userController.user!.data![index].mobile?.toString() ?? '',
                        address: userController.user!.data![index].address?.postOffice ?? '',

                        // You can also include call and SMS functionality here
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
