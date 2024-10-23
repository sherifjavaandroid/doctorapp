
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../controller/auth/sign_up/sign_up_email_otp_verification_controller/sign_up_email_otp_verification_controller.dart';
import '../../utils/basic_screen_imports.dart';

class SignUpEmailOtpInputWidget extends StatelessWidget {
  const SignUpEmailOtpInputWidget({
    super.key,
    required this.emailOTPVerificationFormKey,
    required this.controller,
  });

  final GlobalKey<FormState> emailOTPVerificationFormKey;
  final SignUpEmailOtpVerificationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.89,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Form(
        key: emailOTPVerificationFormKey,
        child: PinCodeTextField(
          appContext: context,
          backgroundColor: Colors.transparent,
          textStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          pastedTextStyle: TextStyle(
            color: Colors.orange.shade600,
            fontWeight: FontWeight.bold,
          ),
          length: 6,
          obscureText: false,
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          validator: (String? value) {
            if (value!.isEmpty) {
              return Strings.pleaseFillOutTheField.tr;
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
            borderWidth: Dimensions.widthSize * 0.2,
            shape: PinCodeFieldShape.box,
            fieldHeight: 52,
            fieldWidth: 47,
            activeFillColor: Colors.transparent,
            inactiveColor: CustomColor.primaryLightTextColor.withOpacity(0.15),
            activeColor: Theme.of(context).primaryColor,
            selectedColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          cursorColor: Get.isDarkMode
              ? CustomColor.whiteColor
              : CustomColor.secondaryDarkColor,
          animationDuration: const Duration(milliseconds: 300),
          errorAnimationController: controller.errorController,
          controller: controller.pinCodeController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onCompleted: (v) {},
          onChanged: (value) {
            controller.changeCurrentText(value);
          },
          beforeTextPaste: (text) {
            return true;
          },
        ),
      ),
    );
  }
}