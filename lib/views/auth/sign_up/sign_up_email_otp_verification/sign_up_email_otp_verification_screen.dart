import '../../../../views/auth/sign_up/sign_up_email_otp_verification/sign_up_email_otp_verification_screen_mobile.dart';

import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';

class SignUpEmailOtpVerificationScreen extends StatelessWidget {
  const SignUpEmailOtpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ResponsiveLayout(
      mobileScaffold: SignUpEmailOtpVerificationScreenMobile(),
    );
  }
}