import 'package:adoctor/backend/backend_utils/custom_loading_api.dart';

import '../../../../controller/find_doctor/appointment_form_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/dropdown/age_dropdown.dart';
import '../../../../widgets/dropdown/input_dropdown.dart';
import '../../../../widgets/find_doctor/schedule_widget.dart';
import '../../../../widgets/inputs/appointment_input.dart';

class AppointmentScreenMobileScreenLayout extends StatelessWidget {
  AppointmentScreenMobileScreenLayout({super.key, required this.controller});
  final AppointmentController controller;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.appointmentForm,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.8,
      ),
      children: [
        _inputWidget(context),
        _scheduleWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        InputFieldWidget(
          controller: controller.patientNameController,
          hint: Strings.enterPatientName,
          labelText: Strings.patientName,
        ),
        verticalSpace(Dimensions.heightSize),
        InputFieldWidget(
          keyboardTypeC: TextInputType.number,
          controller: controller.mobileController,
          hint: Strings.enterMobileNumber,
          labelText: Strings.mobile,
          optional: true,
        ),
        verticalSpace(Dimensions.heightSize),
        InputFieldWidget(
          keyboardTypeC: TextInputType.emailAddress,
          controller: controller.emailController,
          hint: Strings.enterEmailAddress,
          labelText: Strings.emailAddress,
        ),
        verticalSpace(Dimensions.heightSize),
     
         Column(
              crossAxisAlignment: crossStart,
              children: [
                TitleHeading4Widget(
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  text: Strings.appointmentType,
                  fontSize: Dimensions.headingTextSize3 + 2,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.primaryLightTextColor,
                ),
                verticalSpace(Dimensions.heightSize * 0.3),
                InputDropDown(
                  itemsList: controller.appointmentTypeList,
                  selectMethod: controller.appointmentMethod,
                  onChanged: (p0) => controller.appointmentMethod.value = p0!,
                ),
              ],
            ),
        verticalSpace(Dimensions.heightSize),
        Column(
                  crossAxisAlignment: crossStart,
                  children: [
        TitleHeading4Widget(
          text: Strings.gender,
          fontSize: Dimensions.headingTextSize3 + 2,
          fontWeight: FontWeight.w500,
          color: CustomColor.primaryLightTextColor,
        ),
        verticalSpace(Dimensions.heightSize * 0.3),
        InputDropDown(
          itemsList: controller.genderList,
          selectMethod: controller.genderMethod,
          onChanged: (p0) => controller.genderMethod.value = p0!,
        ),
                  ],
                ),
             verticalSpace(Dimensions.heightSize),
        AppointmentAgeDropdown(
        labelText: Strings.age,
        controller: controller.ageController,
        itemsList: controller.ageList,
        currency: controller.ageMethod,
        hint: Strings.enterAge,
        onChanged: (value) {
          controller.ageMethod.value = value!.title;
        },
        ),
        verticalSpace(Dimensions.heightSize),
        InputFieldWidget(
          maxLines: 5,
          controller: controller.massageController,
          hint: Strings.writeHere,
          labelText: Strings.yourMessage,
          optional: true,
        ),
      ]),
    );
  }

  _scheduleWidget(BuildContext context) {
    var data = controller.controller.doctorInfoModel.data.schedule;
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        verticalSpace(Dimensions.heightSize * 1.3),
        const TitleHeading3Widget(
          text: Strings.scheduleAvailable,
          fontWeight: FontWeight.w700,
        ),
        verticalSpace(Dimensions.heightSize * 1.3),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.22,
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => ScheduleWidget(
                    onTap: () {
                      controller.changeColor(index);

                      controller.schedule.value = data[index].id;
                      controller.day.value = data[index].day;
                      controller.date.value = data[index].date;
                      controller.month.value = data[index].month;
                      controller.year.value = data[index].year;
                      controller.toTime.value = data[index].toTime;
                      controller.formTime.value = data[index].fromTime;
                    },
                    months: data[index].month.substring(0, 3),
                    day: data[index].date,
                    date:
                        data[index].day,
                    hours: "${data[index].fromTime} - ${data[index].toTime}",
                    containerColor: controller.selectedColor.value == index
                        ? CustomColor.whiteColor
                        : CustomColor.primaryLightColor,
                    bgColor: controller.selectedColor.value == index
                        ? CustomColor.primaryLightColor
                        : CustomColor.whiteColor,
                    dayTextColor: controller.selectedColor.value == index
                        ? CustomColor.primaryLightColor
                        : CustomColor.whiteColor,
                    dateTextColor: controller.selectedColor.value == index
                        ? CustomColor.whiteColor
                        : CustomColor.primaryLightTextColor,
                  ),
                );
              }),
        )
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
                title: Strings.proceed,
                onPressed: () {
                  controller.appointmentProcess();
                }),
      ),
    );
  }
}
