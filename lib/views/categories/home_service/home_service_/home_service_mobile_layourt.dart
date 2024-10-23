import '../../../../backend/backend_utils/custom_loading_api.dart';
import '../../../../controller/categories/home_service_controller.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/dropdown/age_dropdown.dart';
import '../../../../widgets/dropdown/input_dropdown.dart';
import '../../../../widgets/find_doctor/schedule_widget.dart';
import '../../../../widgets/inputs/appointment_input.dart';
import '../../../../widgets/others/select_type_widget.dart';

class HomeServiceMobileScreenLayout extends StatelessWidget {
  HomeServiceMobileScreenLayout({super.key, required this.controller});
  final HomeServiceController controller;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.homeService,
      ),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
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
        _inputWidget(context),
        _scheduleWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    var data = controller.scheduleModel.data.types;
    return Form(
      key: formKey,
      child: Column(crossAxisAlignment: crossStart, children: [
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
        AppointmentAgeDropdown(
          labelText: Strings.age,
          controller: controller.ageController,
          itemsList: controller.agesList,
          currency: controller.ageMethod,
          hint: Strings.enterAge,
          onChanged: (value) {
            controller.ageMethod.value = value!.title;
          },
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
        horizontalSpace(Dimensions.widthSize),
      
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
        InputFieldWidget(
          controller: controller.addressController,
          hint: Strings.enterAddress,
          labelText: Strings.address,
        ),
        verticalSpace(Dimensions.heightSize),  

        Column(
          crossAxisAlignment: crossStart,
          children: [
            const TitleHeading3Widget(
                textAlign: TextAlign.left, text: Strings.selectType),
            verticalSpace(Dimensions.heightSize),
            data.isNotEmpty
                ? Obx(
                    () => Wrap(
                      direction: Axis.horizontal,
                      runSpacing: Dimensions.heightSize * 0.8,
                      children: List.generate(data.length, (index) {
                        return SelectTypeWidget(
                          onTap: () {
                            controller.selectedType.value = data[index].name;

                            if (controller.selectedIndices.contains(index)) {
                              controller.selectedIndices.remove(
                                  index); // If index is already selected, remove it
                            } else {
                              controller.selectedIndices.add(
                                  index); // If index is not selected, add it
                            }
                          },
                          title: data[index].name,
                          color: controller.selectedIndices.contains(index)
                              ? CustomColor.primaryLightColor
                              : CustomColor.whiteColor,
                          textColor: controller.selectedIndices.contains(index)
                              ? CustomColor.whiteColor
                              : CustomColor.primaryLightColor,
                        );
                      }),
                    ),
                  )
                : Container(),
          ],
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
    var data = controller.scheduleModel.data.schedules;

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
          height: MediaQuery.sizeOf(context).height * 0.4,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => ScheduleWidget(
                    isHours: false,
                    onTap: () {
                      controller.changeColor(index);
                      controller.day.value = data[index].day;
                      controller.date.value = data[index].date;
                      controller.month.value = data[index].month;
                      controller.year.value = data[index].year;
                    },
                    day: data[index].date,
                    months: data[index].month.substring(0, 3),
                    date:
                        "${data[index].day} ${data[index].date}th, ${data[index].month.substring(0, 3)} ${data[index].year}",
                    hours: "",
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
                        : CustomColor.primaryLightTextColor.withOpacity(0.3),
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
      child: PrimaryButton(
          title: Strings.proceed,
          onPressed: () {
            Get.toNamed(Routes.homeServicePreviewScreen);
          }),
    );
  }
}
