import 'dart:ui';

import 'package:adoctor/language/language_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../widgets/inputs/password_input_widget.dart';
import '../../../../backend/backend_utils/custom_loading_api.dart';
import '../../../../backend/local_storage/local_storage.dart';
import '../../../../controller/auth/sign_in/otp_verification_controller/forgot_password_controller.dart';
import '../../../../controller/auth/sign_in/sign_in_controller/sign_in_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/others/check_box_widget.dart';
import '../../../../widgets/text_labels/title_heading5_widget.dart';

class SignInScreenMobile extends StatelessWidget {
  SignInScreenMobile({super.key});

  final controller = Get.put(SignInController());
  final languageController = Get.put(LanguageController());
  final signInformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        left: Dimensions.paddingSize * .70,
        right: Dimensions.paddingSize * .70,
        top: MediaQuery.of(context).size.height * .15,
      ),
      children: [
        _logoWidget(context),
        _welcomeTitleTextWidget(context),
        _welcomeSubTitleTextWidget(context),
        _loginWidget(context),
      ],
    );
  }

  _logoWidget(context) {
    return Image.network(LocalStorage.getAppLogo()!,
        height: Dimensions.heightSize * 7);
  }

  _welcomeTitleTextWidget(BuildContext context) {
    return TitleHeading1Widget(
      text: Strings.logInAndStayConnected,
      textAlign: TextAlign.center,
      padding: EdgeInsets.only(
        top: Dimensions.paddingSize * 1.5,
      ),
    );
  }

  _welcomeSubTitleTextWidget(BuildContext context) {
    return TitleHeading4Widget(
      text: Strings.logInAndStayConnectedOurSecure,
      textAlign: TextAlign.justify,
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize*0.2,
          vertical: Dimensions.paddingSize * .3),
      color: CustomColor.thirdLightTextColor,
    );
  }

  _loginWidget(BuildContext context) {
    return Column(
      children: [
        _loginInputWidget(context),
        _forgotPasswordWidget(context),
        _buttonWidget(context),
        _doNotHaveAnAccount(context),
      ],
    );
  }

  _loginInputWidget(BuildContext context) {
    return Form(
      key: signInformKey,
      child: Column(
        children: [
          verticalSpace(Dimensions.heightSize * 2.5),
          PrimaryTextInputWidget(
            keyboardType: TextInputType.emailAddress,
            controller: controller.emailController,
            hintText: Strings.enterEmailAddress.tr,
            labelText: Strings.emailAddress.tr,
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.marginSizeHorizontal * .5,
            ),
            iconData: Iconsax.sms,
          ),
          verticalSpace(Dimensions.heightSize * 1.33),
          PasswordInputWidget(
            controller: controller.passwordController,
            hintText: Strings.enterPassword,
            labelText: Strings.password,
            iconData: Iconsax.lock,
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.marginSizeHorizontal * .5,
            ),
          )
        ],
      ),
    );
  }

  _forgotPasswordWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.heightSize),
      child: Row(
          mainAxisAlignment: mainSpaceBet,
          crossAxisAlignment: crossCenter,
          children: [
            _rememberMeWidget(context),
            InkWell(
              onTap: (){
                   _showForgotPasswordDialog(context);
              },
              child: 
                CustomTitleHeadingWidget(
                  padding: EdgeInsets.all(Dimensions.paddingSize*0.1),
                  text: Strings.forgotPassword.tr,
                  style: Get.isDarkMode
                      ? CustomStyle.darkHeading5TextStyle.copyWith(
                          color: CustomColor.primaryDarkColor,
                          fontWeight: FontWeight.w500)
                      : CustomStyle.lightHeading5TextStyle.copyWith(
                          color: CustomColor.primaryLightColor,
                          fontWeight: FontWeight.w500),
                ),
              
            ),
          ],
        ),
      
    );
  }

  _rememberMeWidget(BuildContext context) {
    return FittedBox(
      child: Row(
        crossAxisAlignment: crossStart,
        children: [
          CheckBoxWidget(
            isChecked: controller.isSelected,
            onChecked: (value) {
              controller.isSelected.value = value;   
            },
          ),
        
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 3.3),
      child: Column(
        children: [
          Obx(() {
            return controller.isLoading
                ? const CustomLoadingAPI()
                : PrimaryButton(
                    title: Strings.signIn.tr,
                    fontWeight: FontWeight.w500,
                    buttonTextColor: Get.isDarkMode
                        ? CustomColor.primaryBGDarkColor
                        : CustomColor.primaryBGLightColor,
                    fontSize: Dimensions.headingTextSize3,
                    onPressed: () {
                      if (signInformKey.currentState!.validate()) {
                        controller.signInProcess();
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
        ],
      ),
    );
  }

  _doNotHaveAnAccount(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text:languageController.getTranslation( Strings.doNotHaveAnAccount.tr),
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading5TextStyle.copyWith(
                      color: CustomColor.primaryDarkTextColor.withOpacity(.30),
                      fontWeight: FontWeight.w600)
                  : CustomStyle.lightHeading5TextStyle.copyWith(
                      color: CustomColor.primaryLightTextColor.withOpacity(.30),
                      fontWeight: FontWeight.w600),
            ),
            WidgetSpan(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSize * 0.15,
                ),
              ),
            ),
            TextSpan(
              text:languageController.getTranslation( Strings.signUp.tr),
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading4TextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: CustomColor.primaryDarkColor)
                  : CustomStyle.lightHeading4TextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: CustomColor.primaryLightColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  controller.goToSignUpScreen();
                },
            )
          ],
        ),
      ),
    );
  }

  _showForgotPasswordDialog(BuildContext context) {
    final forgotPasswordFormKey = GlobalKey<FormState>();
    final forgotPasswordController = Get.put(ForgotPasswordController());
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize * 0.75),
            child: Form(
              key: forgotPasswordFormKey,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisSize: mainMin,
                    crossAxisAlignment: crossStart,
                    children: [
                      TitleHeading4Widget(
                        padding: EdgeInsets.only(
                            bottom: Dimensions.marginSizeVertical * .5),
                        text: Strings.forgotPassword.tr,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.bold,
                      ),
                      TitleHeading5Widget(
                        padding: EdgeInsets.only(
                            bottom: Dimensions.marginSizeVertical),
                        text: Strings.enterYourEmailToResetPassword.tr,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.normal,
                        color:
                            CustomColor.primaryLightTextColor.withOpacity(.40),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: Dimensions.marginBetweenInputBox),
                        child: PrimaryTextInputWidget(
                          keyboardType: TextInputType.emailAddress,
                          controller: forgotPasswordController.emailController,
                          hintText: Strings.enterEmailAddress.tr,
                          labelText: Strings.emailAddress.tr,
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.marginSizeHorizontal * .5,
                          ),
                          iconData: Iconsax.sms,
                        ),
                      ),
                      Obx(() {
                        return forgotPasswordController.isLoading
                            ? const CustomLoadingAPI()
                            : PrimaryButton(
                                title: Strings.forgotPassword.tr,
                                onPressed: () {
                                  if (forgotPasswordFormKey.currentState!
                                      .validate()) {
                                    // forgotPasswordController.goToForgotPasswordOTPVerificationScreen();

                                    forgotPasswordController
                                        .forgotPasswordProcess(
                                      email: forgotPasswordController
                                          .emailController.text,
                                    );
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
                      verticalSpace(Dimensions.heightSize),
                    ],
                  ),
                  Positioned(
                    right: -32,
                    top: -32,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: CircleAvatar(
                        radius: Dimensions.radius * 1.4,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: const Icon(
                          Icons.close_rounded,
                          color: CustomColor.whiteColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
