import '../../../../backend/backend_utils/custom_loading_api.dart';
import '../../../../controller/categories/home_service_controller.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/find_doctor/doctor_information_widget.dart';
import '../../../../widgets/find_doctor/schedule_widget.dart';

class HomeServicePreviewMobileScreenLayout extends StatelessWidget {
  HomeServicePreviewMobileScreenLayout({super.key, required this.controller});
  final HomeServiceController controller;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.dashboardScreen);
        return true;
      },
      child: Scaffold(
        appBar: PrimaryAppBar(
          leading: BackButton(
            onPressed: () {
              Get.offAllNamed(Routes.dashboardScreen);
            },
          ),
          Strings.preview,
        ),
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.8,
      ),
      children: [
        _scheduleWidget(context),
        _previewWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _scheduleWidget(BuildContext context) {
    return ScheduleWidget(
      isHours: false,
      day: controller.date.value,
      months: controller.month.value.substring(0,3),
      date:
          "${controller.day.value}${controller.date.value}th, ${controller.month.value.substring(0,3)}${controller.year.value}",
      hours: "",
    );
  }

  _previewWidget(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 1.3),
        DoctorInformationWidget(
          variable: Strings.patientName,
          value: controller.patientNameController.text,
        ),
        DoctorInformationWidget(
          variable: Strings.mobile,
          value: controller.mobileController.text,
        ),
        DoctorInformationWidget(
          variable: Strings.email,
          value: controller.emailController.text,
        ),
        DoctorInformationWidget(
          variable: Strings.age,
          value:
              "${controller.ageController.text}/${controller.ageMethod.value}",
        ),
        DoctorInformationWidget(
          variable: Strings.gender,
          value: controller.genderMethod.value,
        ),
        DoctorInformationWidget(
            variable: Strings.address,
            value: controller.addressController.text),
        DoctorInformationWidget(
          variable: Strings.type,
          value: controller.selectedType.value,
          stoke: false,
        ),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical),
      child: Obx(
        () => controller.isUpdateLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.confirmAppointment,
                onPressed: () {
                  controller.homeServiceProcess();
                }),
      ),
    );
  }
}
