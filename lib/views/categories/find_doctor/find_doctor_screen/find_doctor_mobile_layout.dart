import '../../../../backend/backend_utils/custom_loading_api.dart';
import '../../../../backend/local_storage/local_storage.dart';
import '../../../../backend/services/api_endpoint.dart';
import '../../../../controller/find_doctor/find_doctor_controller.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/appbar/back_button.dart';
import '../../../../widgets/find_doctor/doctor_details_widget.dart';
import '../../../../widgets/others/search_box_widget.dart';

class FindDoctorMobileScreenLayout extends StatelessWidget {
  FindDoctorMobileScreenLayout({super.key, required this.controller});

  final FindDoctorController controller;
  final formKey = GlobalKey<FormState>();
  final appTitleList = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        appTitleList[0],
        leading: BackButtonWidget(onTap: () {
          Get.close(2);
        }),
      ),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return RefreshIndicator(
      color: CustomColor.whiteColor,
      backgroundColor: CustomColor.primaryLightColor,
      strokeWidth: 2.5,
      onRefresh: () async {
        controller.getDoctorList(
          LocalStorage.getBranchId(),
          LocalStorage.getDepartment(),
        );
        return Future<void>.delayed(const Duration(seconds: 3));
      },
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * 0.5,
        ),
        children: [
          _searchBoxWidget(context),
          _doctorDetails(context),
        ],
      ),
    );
  }

  // search box
  _searchBoxWidget(BuildContext context) {
    return Obx(
      () => controller.isSearchLoading
          ? const CustomLoadingAPI()
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: Dimensions.paddingSize * 0.1,
                    bottom: Dimensions.paddingSize * 0.3,
                  ),
                  child: SearchBoxWidget(
                      controller: controller.searchBarController,
                      buttonOnPressed: () {
                        LocalStorage.saveBranchId(
                            id: controller.controller.branchId.value);
                        LocalStorage.saveDepartmentId(
                            id: controller.controller.departmentId.value);
                        controller.getDoctorList(LocalStorage.getBranchId(),
                            LocalStorage.getDepartment());
                        Get.toNamed(
                          Routes.findDoctorScreen,
                          arguments: [Strings.findDoctor],
                        );
                      },
                      onTap: () {
                        controller.searchBarController.clear();

                        controller.filterDoctors('');
                      },
                      onChanged: (value) {
                        controller.filterDoctors(value);
                      },
                      resetOnTap: () {},
                      hintText: Strings.searchHere.tr),
                ),
              ],
            ),
    );
  }

  _doctorDetails(BuildContext context) {
    var data = controller.foundDoctor.value.isEmpty
        ? controller.findDoctorListModel.data.doctors
        : controller.foundDoctor.value;

    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return DoctorDetailsWidget(
            onTap: () {
              controller.slug.value = data[index].slug;
              controller.name.value = data[index].name;
              controller.doctorTitle.value = data[index].doctorTitle!;
              Get.toNamed(Routes.doctorProfileScreen);
            },
            image:
                "${ApiEndpoint.mainDomain}/${controller.findDoctorListModel.data.imageAsset.pathLocation}/${data[index].image}",
            name: data[index].name,
            designation: data[index].doctorTitle!,
            qualification: data[index].qualification,
            categories: data[index].designation,
            amount: data[index].fees,
            speciality: data[index].speciality,
          );
        });
  }
}
