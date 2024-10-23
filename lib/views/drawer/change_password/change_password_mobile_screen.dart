import 'package:iconsax/iconsax.dart';

import '../../../backend/backend_utils/custom_loading_api.dart';
import '../../../controller/drawer/change_password_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/inputs/password_input_widget.dart';

class ChangePasswordMobileScreenLayout extends StatelessWidget {
  ChangePasswordMobileScreenLayout({super.key, required this.controller});

  final ChangePasswordController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(
        Strings.changePassword,
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
        _buttonWidget(context),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          verticalSpace(Dimensions.heightSize*0.8),
          PasswordInputWidget(
            controller: controller.oldPasswordController,
            hintText: Strings.enteroldpassword,
            labelText: Strings.oldPassword,
            iconData: Iconsax.lock,
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.marginSizeHorizontal * .5,
            ),
          ),
          verticalSpace(Dimensions.heightSize*1.5),
          PasswordInputWidget(
            controller: controller.newPasswordController,
            hintText: Strings.enterNewPassword,
            labelText: Strings.newPassword,
            iconData: Iconsax.lock,
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.marginSizeHorizontal * .5,
            ),
          ),
      verticalSpace(Dimensions.heightSize * 1.5),
          PasswordInputWidget(
            controller: controller.confirmPasswordController,
            hintText: Strings.enterConfirmPassword,
            labelText: Strings.confirmPassword,
            iconData: Iconsax.lock,
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.marginSizeHorizontal * .5,
            ),
          ),
          verticalSpace(Dimensions.heightSize ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical),
      child: Obx(
        () => controller.isUpdateLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.changePassword,
                onPressed: () {
               if (formKey.currentState!.validate()) {
                    controller.changePasswordProcess(
                      context: context,
                      currentPassword: controller.oldPasswordController.text,
                      password: controller.newPasswordController.text,
                      passwordConfirmation:
                          controller.confirmPasswordController.text,
                    );
               }
             
                },
              ),
      ),
    );
  }
}
