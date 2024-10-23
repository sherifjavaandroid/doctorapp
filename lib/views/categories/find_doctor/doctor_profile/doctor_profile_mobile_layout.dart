import '../../../../backend/backend_utils/custom_loading_api.dart';
import '../../../../backend/services/api_endpoint.dart';
import '../../../../controller/find_doctor/doctor_profile_controller.dart';
import '../../../../custom_assets/assets.gen.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/find_doctor/doctor_information_widget.dart';
import '../../../../widgets/others/custom_image_widget.dart';

class DoctorProfileMobileScreenLayout extends StatelessWidget {
  DoctorProfileMobileScreenLayout({super.key, required this.controller});
  final DoctorProfileController controller;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        controller.controller.name.toString(),
        subTitle: controller.controller.doctorTitle.toString(),
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
        _imageWidget(context),
        _doctorInfoWidget(context),
        _doctorChamberWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _imageWidget(BuildContext context) {
    var data = controller.doctorInfoModel.data.info;
    var imagePath = controller.doctorInfoModel.data.imageAsset.pathLocation;
    return CircleAvatar(
      backgroundColor: CustomColor.primaryLightColor,
      radius: Dimensions.radius * 7.4,
      child: CircleAvatar(
        radius: Dimensions.radius * 7,
        backgroundImage: NetworkImage(
          "${ApiEndpoint.mainDomain}/$imagePath/${data.image}",
        ),
      ),
    );
  }

  _doctorInfoWidget(BuildContext context) {
       var data = controller.doctorInfoModel.data.info;
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 1.5),
        Row(
          children: [
            CustomImageWidget(path: Assets.icon.userIcon),
            horizontalSpace(Dimensions.widthSize),
            TitleHeading1Widget(
              text: Strings.doctorInformation,
              fontSize: Dimensions.headingTextSize3,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * 1.3),
         DoctorInformationWidget(
          variable: Strings.qualifications,
          value: data.qualification,
        ),
         DoctorInformationWidget(
          variable: Strings.speciality,
          value: data.speciality,
        ),
         DoctorInformationWidget(
          variable: Strings.languageSpoken,
          value: data.language,
        ),
         DoctorInformationWidget(
          variable: Strings.designation,
          value: data.designation,
        ),
         DoctorInformationWidget(
          variable: Strings.departmentName,
          value: data.department,
          stoke: false,
        ),
      ],
    );
  }

  _doctorChamberWidget(BuildContext context) {

       var data = controller.doctorInfoModel.data.info;
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 1.6),
        Row(
          children: [
            CustomImageWidget(path: Assets.icon.chamber),
            horizontalSpace(Dimensions.widthSize),
            TitleHeading1Widget(
              text: Strings.chamber,
              fontSize: Dimensions.headingTextSize3,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * 1.3),
         DoctorInformationWidget(
          variable: Strings.contact,
          value: data.contact,
        ),
        
         DoctorInformationWidget(
          variable: Strings.offDay,
          value: data.offDays,
        ),
         DoctorInformationWidget(
          variable: Strings.floorNumber,
          value: data.floorNumber,
        ),
         DoctorInformationWidget(
          variable: Strings.roomNumber,
          value: data.roomNumber,
        ),
         DoctorInformationWidget(
          variable: Strings.branchName,
          value: data.branch,
        ),
         DoctorInformationWidget(
          variable: Strings.address,
          value: data.address,
        ),
         DoctorInformationWidget(
          variable: Strings.fees,
          value: data.fees.toString(),
          stoke: false,
        ),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.heightSize * 1.5,
      ),
      child: PrimaryButton(
          title: Strings.makeAppointment,
          onPressed: () {
            Get.toNamed(Routes.appointmentScreen);
          }),
    );
  }
}
