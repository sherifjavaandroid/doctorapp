import '../../../../backend/backend_utils/custom_loading_api.dart';
import '../../../../controller/find_doctor/appointment_form_controller.dart';
import '../../../../language/language_controller.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/find_doctor/doctor_information_widget.dart';
import '../../../../widgets/find_doctor/payment_dropdown.dart';
import '../../../../widgets/find_doctor/schedule_widget.dart';

class FindDoctorPreviewMobileScreenLayout extends StatelessWidget {
  FindDoctorPreviewMobileScreenLayout({super.key, required this.controller});
  final AppointmentController controller;
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
              Get.close(1);
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
        _selectMethodWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _scheduleWidget(BuildContext context) {
    return ScheduleWidget(
      months: controller.month.value,
      day: controller.date.value,
      date:
          "${controller.day.value} ${controller.date.value}th, ${controller.month.value} ${controller.year.value}",
      hours: "${controller.formTime.value} - ${controller.toTime.value}",
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
          variable: Strings.appointmentType,
          value: controller.appointmentMethod.value,
        ),
      ],
    );
  }

  _selectMethodWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        verticalSpace(Dimensions.heightSize),
        const TitleHeading3Widget(text: Strings.paymentMethods),
        verticalSpace(Dimensions.heightSize * 0.4),
          PaymentDropDown(
          itemsList: controller.currencyList,
          selectMethod: controller.selectedGateway,
          onChanged: (value) {
            controller.selectedGateway.value = value!.name;
            controller.selectedAlias.value = value.alias;
            if (controller.dropdownSelected.value == true) {
              // Dropdown is selected, so unselect the cash payment widget
              controller.isCashPayment.value = false;
            } else {
              // Dropdown is unselected, so mark it as selected
              controller.dropdownSelected.value = true;
            }
          },
        ),
        verticalSpace(Dimensions.heightSize * 0.6),

        Obx(
          () => InkWell(
            onTap: () {
              controller.isCashPayment.value = !controller.isCashPayment.value;
              if (controller.isCashPayment.value == true) {
                controller.selectedGateway.value =
                    Get.find<LanguageController>()
                        .getTranslation(Strings.onlinePayment);
                controller.selectedAlias.value = "";
              }
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSize,
                  vertical: Dimensions.paddingSize * 0.5),
              margin:
                  EdgeInsets.only(bottom: Dimensions.marginSizeVertical * 0.2),
              decoration: BoxDecoration(
                color: controller.isCashPayment.value == true
                    ? CustomColor.primaryLightColor
                    : Colors.white,
                border:
                    Border.all(width: 1, color: CustomColor.primaryLightColor),
                borderRadius: BorderRadius.circular(Dimensions.radius),
              ),
              child:  TitleHeading4Widget(
                text: Strings.cashPayment,
                  color: controller.isCashPayment.value == false
                    ? CustomColor.primaryLightColor
                    : Colors.white,
                fontSize: Dimensions.headingTextSize3+1,
              ),
            ),
          ),
        ),
      
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical),
      child: Obx(
        () => controller.isConfirmLoading || controller.isAutomaticLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.confirmAppointment,
                onPressed: () {
                  if (controller.isCashPayment.value == false) {
                    controller.paymentAutomaticProcess();
                  } else {
                    controller.appointmentConfirmProcess();
                  }
                }),
      ),
    );
  }
}
