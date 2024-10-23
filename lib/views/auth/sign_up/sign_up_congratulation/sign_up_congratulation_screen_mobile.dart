import '../../../../custom_assets/assets.gen.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/others/custom_image_widget.dart';

class SignUpCongratulationScreenMobile extends StatelessWidget {
  const SignUpCongratulationScreenMobile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  // body : List of widget
  _bodyWidget(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.paddingSize, right: Dimensions.paddingSize),
        child: Column(
          // crossAxisAlignment: crossCenter,
          mainAxisAlignment: mainCenter,
          children: [
            _congratulationImageWidget(context),
            _congratulationTitleTextWidget(context),
            _congratulationSubTitleTextWidget(context),
            _okayButtonWidget(context),
          ],
        ),
      ),
    );
  }
  //congratulation image widget
  _congratulationImageWidget(BuildContext context) {
    return CircleAvatar(
      radius: Dimensions.radius * 6.5,
      backgroundColor: CustomColor.primaryLightColor.withOpacity(.20),
      child: CircleAvatar(
        radius: Dimensions.radius * 5.5,
        backgroundColor: CustomColor.primaryLightColor,
        child: CustomImageWidget(
          height: Dimensions.heightSize * 3,
          width: Dimensions.widthSize * 3,
          scale: 4,
          path: Assets.icon.tickMark,
        ),
      ),
    );
  }

  //congratulation text widget
  _congratulationTitleTextWidget(BuildContext context) {
    return TitleHeading2Widget(
      text: Strings.congratulation.tr,
      padding: EdgeInsets.only(top: Dimensions.paddingSize),
    );
  }

  //congratulation subtitle text widget
  _congratulationSubTitleTextWidget(BuildContext context) {
    return TitleHeading4Widget(
      textAlign: TextAlign.center,
      text: Strings.signUpSuccessText.tr,
      padding: EdgeInsets.only(
        top: Dimensions.paddingSize * 0.33,
        bottom: Dimensions.paddingSize * 0.833,
      ),
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.headingTextSize3,
      color: Get.isDarkMode
          ? CustomColor.primaryDarkTextColor.withOpacity(0.30)
          : CustomColor.primaryLightTextColor.withOpacity(0.30),
    );
  }
  //okay button
  _okayButtonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.okay.tr,
      onPressed: () {
        Get.offAllNamed(Routes.dashboardScreen);
      },
      borderColor: Theme.of(context).primaryColor,
      buttonColor: Theme.of(context).primaryColor,
      // shape: RoundedRectangleBorder(borderRadius: ),
    );
  }
}