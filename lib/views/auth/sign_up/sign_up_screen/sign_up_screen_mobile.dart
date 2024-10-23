import 'package:flutter/gestures.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../backend/backend_utils/custom_loading_api.dart';
import '../../../../backend/backend_utils/custom_snackbar.dart';
import '../../../../backend/local_storage/local_storage.dart';
import '../../../../controller/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import '../../../../language/language_controller.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/inputs/password_input_widget.dart';
import '../../../../widgets/others/term_condition.dart';
import '../../../../widgets/text_labels/title_heading5_widget.dart';

class SignUpScreenMobile extends StatelessWidget {
  SignUpScreenMobile({super.key});

  final signUpFormKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());
  final languageController = Get.put(LanguageController());
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
        _createAccountTitleTextWidget(context),
        _createAccountSubTitleTextWidget(context),
        _loginWidget(context),
      ],
    );
  }

  _logoWidget(context) {
    return Image.network(LocalStorage.getAppLogo()!,
        height: Dimensions.heightSize * 7);
  }

  _createAccountTitleTextWidget(BuildContext context) {
    return TitleHeading2Widget(
      text: Strings.createAccount,
      textAlign: TextAlign.center,
      padding: EdgeInsets.only(
        top: Dimensions.paddingSize * 1.5,
      ),
    );
  }

  _createAccountSubTitleTextWidget(BuildContext context) {
    return TitleHeading5Widget(
      text: Strings.becomeAPartOfOurCommunityBy,
      textAlign: TextAlign.justify,
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * 0.2,
          vertical: Dimensions.paddingSize * .3),
      color: CustomColor.primaryLightTextColor.withOpacity(.20),
    );
  }

  _loginWidget(BuildContext context) {
    return Column(
      children: [
        _signUpInputWidget(context),
        _buttonWidget(context),
        _alreadyHaveAnAccount(context),
      ],
    );
  }

  _signUpInputWidget(BuildContext context) {
    return Form(
      key: signUpFormKey,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          verticalSpace(Dimensions.heightSize * 2.5),
          Row(
            children: [
              Expanded(
                child: PrimaryTextInputWidget(
                  controller: controller.firstNameController,
                  hintText: Strings.enterName.tr,
                  labelText: Strings.firstName.tr,
                  iconData: Iconsax.user,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.marginSizeHorizontal * .5,
                  ),
                ),
              ),
              horizontalSpace(Dimensions.widthSize),
              Expanded(
                child: PrimaryTextInputWidget(
                  controller: controller.lastNameController,
                  hintText: Strings.enterName.tr,
                  labelText: Strings.lastName.tr,
                  iconData: Iconsax.user,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.marginSizeHorizontal * .5,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(Dimensions.heightSize * 1.33),
          PrimaryTextInputWidget(
            controller: controller.signUpEmailController,
            hintText: Strings.enterEmailAddress.tr,
            labelText: Strings.emailAddress.tr,
            keyboardType: TextInputType.emailAddress,
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.marginSizeHorizontal * .5,
            ),
            iconData: Iconsax.sms,
          ),
          verticalSpace(Dimensions.heightSize * 1.33),
          PasswordInputWidget(
            controller: controller.signUpPasswordController,
            hintText: Strings.enterPassword,
            labelText: Strings.password,
            iconData: Iconsax.lock,
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.marginSizeHorizontal * .5,
            ),
          ),
          _privacyPolicyWidget(context),
        ],
      ),
    );
  }

  _privacyPolicyWidget(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(top: Dimensions.paddingSize * .5),
        child: Row(
          mainAxisAlignment: mainStart,
          crossAxisAlignment: crossEnd,
          children: [
            Padding(
              padding: EdgeInsets.only(top: Dimensions.paddingSize * .1),
              child: TermAndCondition(
                isChecked: controller.isSelected,
                onChecked: (value) {
                  controller.isSelected.value = value;
                  // print(value);
                },
              ),
            ),
            horizontalSpace(Dimensions.widthSize * .35),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.privacyPolicy);
              },
              child: CustomTitleHeadingWidget(
                text: Strings.termAndCondition.tr,
                style: Get.isDarkMode
                    ? CustomStyle.darkHeading5TextStyle.copyWith(
                        fontSize: Dimensions.headingTextSize4,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.secondaryDarkColor,
                        letterSpacing: .01,
                        wordSpacing: .01)
                    : CustomStyle.lightHeading5TextStyle.copyWith(
                        color: CustomColor.primaryLightColor,
                        fontSize: Dimensions.headingTextSize4,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .01,
                        wordSpacing: .01),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimensions.heightSize * 2.5, bottom: Dimensions.heightSize * 2),
      child: Column(
        children: [
          Obx(() {
            return controller.isLoading
                ? const CustomLoadingAPI()
                : PrimaryButton(
                    title: Strings.signUp.tr,
                    fontWeight: FontWeight.w500,
                    buttonTextColor: Get.isDarkMode
                        ? CustomColor.primaryBGDarkColor
                        : CustomColor.primaryBGLightColor,
                    fontSize: Dimensions.headingTextSize3,
                    onPressed: () {
                      if (signUpFormKey.currentState!.validate()) {
                        controller.isSelected.value == false
                            ? controller.signUpProcess()
                            : CustomSnackBar.error(
                                Get.find<LanguageController>()
                                    .getTranslation(Strings.acceptTerms));
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

  _alreadyHaveAnAccount(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: languageController
                  .getTranslation(Strings.alreadyHaveAnAccount.tr),
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
              text: languageController.getTranslation(Strings.signIn.tr),
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading4TextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: CustomColor.primaryDarkColor)
                  : CustomStyle.lightHeading4TextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: CustomColor.primaryLightColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  controller.goToSignInScreen();
                },
            )
          ],
        ),
      ),
    );
  }
}
