import '../../../../backend/backend_utils/custom_loading_api.dart';
import '../../../../backend/local_storage/local_storage.dart';
import '../../../../controller/auth/sign_up/sign_up_email_otp_verification_controller/sign_up_email_otp_verification_controller.dart';
import '../../../../custom_assets/assets.gen.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/inputs/sign_up_email_otp_input_widget.dart';
import '../../../../widgets/others/custom_image_widget.dart';

class SignUpEmailOtpVerificationScreenMobile extends StatelessWidget {
  SignUpEmailOtpVerificationScreenMobile({super.key});

  final emailOTPVerificationFormKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpEmailOtpVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(Strings.emailVerification.tr),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: crossCenter,
        children: [
          _appLogoWidget(context),
          verticalSpace(Dimensions.heightSize),
          _otpWidget(context),
        ],
      ),
    );
  }

  _appLogoWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.paddingSize * 3),
      child: CircleAvatar(
        radius: Dimensions.radius * 5.5,
        backgroundColor: CustomColor.primaryLightColor.withOpacity(.30),
        child: CircleAvatar(
          radius: Dimensions.radius * 4.5,
          backgroundColor: CustomColor.primaryLightColor.withOpacity(.70),
          child: CircleAvatar(
            radius: Dimensions.radius * 3.5,
            backgroundColor: CustomColor.primaryLightColor,
            child: CustomImageWidget(
              height: Dimensions.heightSize * 2,
              width: Dimensions.widthSize * 2,
              scale: 4,
              path: Assets.icon.envelop,
            ),
          ),
        ),
      ),
    );
  }

  _otpWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimensions.radius * 4),
          topRight: Radius.circular(Dimensions.radius * 4),
        ),
      ),
      child: Column(
        children: [
          _emailOtpVerificationTextWidget(context),
          _emailOtpVerificationEmailTextWidget(context),
          _emailOtpInputWidget(context),
          _timerWidget(context),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _emailOtpVerificationTextWidget(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize),
        TitleHeading2Widget(
          text: Strings.otpVerification,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  _emailOtpVerificationEmailTextWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.paddingSize * .25,
      ),
      child: FittedBox(
        child: Row(
          children: [
            TitleHeading4Widget(
              text: Strings.enterTheOtpCodeSentTo.tr,
              textAlign: TextAlign.center, 
              fontWeight: FontWeight.w400,
              color: Get.isDarkMode
                  ? CustomColor.primaryDarkTextColor
                  : CustomColor.primaryLightTextColor.withOpacity(0.4),
            ),
            TitleHeading4Widget(
              text: " ${LocalStorage.getEmail()}",
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
              color: Get.isDarkMode
                  ? CustomColor.primaryDarkTextColor
                  : CustomColor.primaryLightTextColor.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }

  _emailOtpInputWidget(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 2),
        SignUpEmailOtpInputWidget(
          controller: controller,
          emailOTPVerificationFormKey: emailOTPVerificationFormKey,
        ),
      ],
    );
  }

  _timerWidget(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.access_time_outlined,
                color: CustomColor.primaryLightColor,
              ),
              verticalSpace(Dimensions.widthSize * 4),
              horizontalSpace(Dimensions.widthSize),
              CustomTitleHeadingWidget(
                text:
                    '0${controller.minuteRemaining.value}:${controller.secondsRemaining.value}',
                style: Get.isDarkMode
                    ? CustomStyle.darkHeading3TextStyle
                    : CustomStyle.lightHeading3TextStyle,
              ),
            ],
          ),
          controller.secondsRemaining.value > 0
              ? SizedBox(
                  height: Dimensions.heightSize,
                )
              : _textAndTextButtonWidget(context),
        ],
      ),
    );
  }

  _textAndTextButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: Dimensions.heightSize, bottom: Dimensions.heightSize * 2),
      child: Row(
        mainAxisAlignment: mainCenter,
        children: [
          CustomTitleHeadingWidget(
            text: Strings.didNotGetCode.tr,
            style: Get.isDarkMode
                ? CustomStyle.darkHeading5TextStyle.copyWith(
                    color: CustomColor.primaryDarkTextColor,
                    fontSize: Dimensions.headingTextSize4)
                : CustomStyle.lightHeading5TextStyle.copyWith(
                    color: CustomColor.primaryLightTextColor,
                    fontSize: Dimensions.headingTextSize4),
          ),
          horizontalSpace(Dimensions.widthSize),
          InkWell(
            onTap: controller.resendCode,
            child: CustomTitleHeadingWidget(
              text: Strings.resend.tr,
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading5TextStyle.copyWith(
                      color: CustomColor.primaryDarkColor,
                      fontSize: Dimensions.headingTextSize4)
                  : CustomStyle.lightHeading5TextStyle.copyWith(
                      color: CustomColor.primaryLightColor,
                      fontSize: Dimensions.headingTextSize4),
            ),
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * .75,
      ),
      child: Obx(() {
        return controller.isLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.submit.tr,
                onPressed: () {
                  if (emailOTPVerificationFormKey.currentState!.validate()) {
                    controller.emailVerificationProcess();
                  }
                },
                borderColor: Get.isDarkMode
                    ? CustomColor.primaryDarkColor
                    : CustomColor.primaryLightColor,
                buttonColor: Get.isDarkMode
                    ? CustomColor.primaryDarkColor
                    : CustomColor.primaryLightColor,
              );
      }),
    );
  }
}
