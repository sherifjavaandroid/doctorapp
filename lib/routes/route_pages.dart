import 'package:adoctor/widgets/others/payment_web_view_screen.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../backend/services/api_endpoint.dart';
import '../bindings/splash_screen_binding.dart';
import '../language/english.dart';
import '../views/auth/sign_in/forgot_password_otp_verification/forgot_password_otp_verification_screen.dart';
import '../views/auth/sign_in/reset_password/reset_password_screen.dart';
import '../views/auth/sign_in/reset_password_congratulation/reset_password_congratulation_screen.dart';
import '../views/auth/sign_in/sign_in_screen/sign_in_screen.dart';
import '../views/auth/sign_up/sign_up_congratulation/sign_up_congratulation_screen.dart';
import '../views/auth/sign_up/sign_up_email_otp_verification/sign_up_email_otp_verification_screen.dart';
import '../views/auth/sign_up/sign_up_screen/sign_up_screen.dart';
import '../views/categories/branches/branch_screen.dart';
import '../views/categories/find_doctor/appointment_form/appointment_screen.dart';
import '../views/categories/find_doctor/doctor_profile/doctor_profile_screen.dart';
import '../views/categories/find_doctor/find_doctor_screen/find_doctor_screen.dart';
import '../views/categories/find_doctor/preview/find_doctor_preview_screen.dart';
import '../views/categories/health_package/heath_package_screen.dart';
import '../views/categories/home_service/home_preview/home_service_preview_screen.dart';
import '../views/categories/home_service/home_service_/home_service_screen.dart';
import '../views/categories/investigation/investigation_screen.dart';
import '../views/common/common_success_screen.dart';
import '../views/dashboard/dashboard_screen/dashboard_screen.dart';
import '../views/dashboard/profile/profile_screen.dart';
import '../views/drawer/change_password/change_password_screen.dart';
import '../views/drawer/history_screen/history_screen.dart';
import '../views/drawer/home_service_history/home_service_history_screen.dart';
import '../views/drawer/settings/settings_screen.dart';
import '../views/drawer/web_view_screen.dart';
import '../views/onBoard/onboard_screen.dart';
import '../views/setup_location/add_home/add_home_screen.dart';
import '../views/setup_location/choose_your_location/choose_your_location_screen.dart';
import '../views/setup_location/setup_location_screen/setup_location_screen.dart';
import '../views/splash_screen/splash_screen.dart';
import '../widgets/others/webview_webjournal.dart';

class RoutePageList {
  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: Routes.onboardScreen,
      page: () => const OnBoardScreen(),
    ),
    GetPage(
      name: Routes.signInScreen,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: Routes.otpVerificationScreen,
      page: () => const ForgotPasswordOtpVerificationScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordCongratulationScreen,
      page: () => const ResetPasswordCongratulationScreen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: Routes.signUpEmailOtpVerificationScreen,
      page: () => const SignUpEmailOtpVerificationScreen(),
    ),
    GetPage(
      name: Routes.signUpCongratulationScreen,
      page: () => const SignUpCongratulationScreen(),
    ),
    GetPage(
      name: Routes.setupLocationScreen,
      page: () => const SetupLocationScreen(),
    ),
    GetPage(
      name: Routes.chooseYourLocationScreen,
      page: () => const ChooseYourLocationScreen(),
    ),
    GetPage(
      name: Routes.addHomeScreen,
      page: () => const AddHomeScreen(),
    ),
    GetPage(
      name: Routes.dashboardScreen,
      page: () => const DashboardScreen(),
    ),
    GetPage(
      name: Routes.changePasswordScreen,
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: Routes.historyScreen,
      page: () => HistoryScreen(),
    ),

    //categories
    GetPage(
      name: Routes.findDoctorScreen,
      page: () => FindDoctorScreen(),
    ),
    GetPage(
      name: Routes.doctorProfileScreen,
      page: () => DoctorProfileScreen(),
    ),
    GetPage(
      name: Routes.appointmentScreen,
      page: () => AppointmentScreen(),
    ),
    GetPage(
      name: Routes.findDoctorPreviewScreen,
      page: () => FindDoctorPreviewScreen(),
    ),
    GetPage(
      name: Routes.branchScreen,
      page: () => BranchScreen(),
    ),
    // GetPage(
    //   name: Routes.doctorListScreen,
    //   page: () => DoctorListScreen(),
    // ),
    GetPage(
      name: Routes.healthPackageScreen,
      page: () => HealthPackageScreen(),
    ),
    GetPage(
      name: Routes.investigationScreen,
      page: () => InvestigationScreen(),
    ),
    GetPage(
      name: Routes.homeServiceScreen,
      page: () => HomeServiceScreen(),
    ),
    GetPage(
      name: Routes.commonSuccessScreen,
      page: () => CommonSuccessScreen(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: Routes.homeServiceHistory,
      page: () => HomeServiceHistoryScreen(),
    ),
    GetPage(
      name: Routes.homeServicePreviewScreen,
      page: () => HomeServicePreviewScreen(),
    ),
    GetPage(
      name: Routes.settingScreen,
      page: () => const SettingScreen(),
    ),
    GetPage(
      name: Routes.webScreen,
      page: () => const WebPaymentScreens(),
    ),
    //help center
    GetPage(
      name: Routes.helpCenter,
      page: () => const WebPaymentScreen(
        title: Strings.helpCenter,
        url: "${ApiEndpoint.mainDomain}/contact",
      ),
    ),

    //privacy policy
    GetPage(
      name: Routes.privacyPolicy,
      page: () => const WebPaymentScreen(
        title: Strings.privacyPolicy,
        url: "${ApiEndpoint.mainDomain}/link/privacy-policy",
      ),
    ),

    //about us
    GetPage(
      name: Routes.aboutUs,
      page: () => const WebPaymentScreen(
        title: Strings.aboutUs,
        url: "${ApiEndpoint.mainDomain}/about",
      ),
    ),
     //privacy policy
    GetPage(
      name: Routes.webJournalScreen,
      page: () => const WebJournalScreen(
        title: Strings.webJournal,
        url: "${ApiEndpoint.mainDomain}/journals",
      ),
    ),
  ];
}
