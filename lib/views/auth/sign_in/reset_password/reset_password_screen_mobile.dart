
import 'package:iconsax/iconsax.dart';
import '../../../../backend/backend_utils/custom_loading_api.dart';
import '../../../../controller/auth/sign_in/reset_password_controller/reset_password_controller.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/inputs/password_input_widget.dart';

class ResetPasswordScreenMobile extends StatelessWidget {
  ResetPasswordScreenMobile({Key? key}) : super(key: key);

  final controller = Get.put(ResetPasswordController());
  final resetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.signInScreen);
        return true;
      },
      child: Scaffold(
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(Dimensions.heightSize * 3.5),
          _resetPasswordText(context),
          _inputFieldWidget(context),
        ],
      ),
    );
  }

  _inputFieldWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.paddingSize,
        right: Dimensions.paddingSize,
        top: Dimensions.paddingSize * 1.33,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          _newPasswordInputWidget(context),
          _resetPasswordButtonWidget(context),
        ],
      ),
    );
  }

  //reset password text Widget
  _resetPasswordText(BuildContext context) {
    return TitleHeading2Widget(
      text: Strings.resetPassword.tr,
    );
  }

//new password input widget
  _newPasswordInputWidget(BuildContext context) {
    return Form(
      key: resetPasswordFormKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.marginBetweenInputBox * .25),
            child: PasswordInputWidget(
              controller: controller.newPassword,
              hintText: Strings.enterNewPassword.tr,
              labelText: Strings.newPassword.tr,
              iconData: Iconsax.lock,
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * .5,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.marginBetweenInputBox),
            child: PasswordInputWidget(
              controller: controller.confirmPassword,
              hintText: Strings.enterConfirmPassword.tr,
              labelText: Strings.confirmPassword.tr,
              iconData: Iconsax.lock,
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * .5,
              ),
            ),
          ),
        ],
      ),
    );
  }

//reset password button
  _resetPasswordButtonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.paddingSize),
      child: Obx(() {
        return controller.isLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.resetPassword.tr,
                onPressed: () {
                  if (resetPasswordFormKey.currentState!.validate()) {
                    controller.resetPasswordPrecess();
                  }
                },
                borderColor: Theme.of(context).primaryColor,
                buttonColor: Theme.of(context).primaryColor,
              );
      }),
    );
  }
}
