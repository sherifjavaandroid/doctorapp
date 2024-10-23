import '/extensions/custom_extensions.dart';
import '../local_storage/local_storage.dart';

class ApiEndpoint {

  static const String mainDomain = "https://adoctor.appdevs.net";
  static const String baseUrl = "$mainDomain/api/v1";
  /*basic settings*/
  static String basicURL = '/settings/basic/settings'.addDBaseURl();
  static String languagesURL = '/settings/language'.addDBaseURl();

  /*login*/
  static String loginURL = '/login'.addDBaseURl();

  /*forgot password section*/
  static String forgotPasswordOtpURL =
      '/password/forgot/find/user'.addDBaseURl();

  static String forgotPasswordResendOtpURL =
      '/password/forgot/resend/code?token=${LocalStorage.getToken()}'
          .addDBaseURl();
  static String forgotPasswordVerifyOtpURL =
      '/password/forgot/verify/code'.addDBaseURl();
  static String resetPasswordURL = '/password/forgot/reset'.addDBaseURl();

  /*signup section*/
  static String signUpURL = '/register'.addBaseURl();
  static String emailVerificationURL = '/user/verify/code'.addDBaseURl();
  static String signUpResendOtpURL = '/user/resend/code'.addDBaseURl();

  /*profile section*/
  static String profileURL = '/user/profile/info'.addDBaseURl();
  static String profileUpdateURL = '/user/profile/info/update'.addDBaseURl();
  static String changePasswordURL =
      '/user/profile/password/update'.addDBaseURl();
  static String historyURL = '/user/history'.addDBaseURl();
  static String serviceHistoryURL = '/user/home-service-history'.addDBaseURl();

/*================================*/
  //investigation/
  static String investigationListURL = '/user/investigation'.addDBaseURl();
  static String branchesListURL = '/user/branch'.addDBaseURl();
  static String healthPackageURL = '/user/health/package'.addDBaseURl();
  static String findDoctorListURL = '/user/doctor'.addDBaseURl();
  static String doctorInfoURL = '/user/doctor/information/?slug='.addDBaseURl();
  static String appointmentURL = '/user/appointment/booking/store'.addDBaseURl();
  static String scheduleURL = '/user/home/service'.addDBaseURl();
  static String homeServiceURL = '/user/home/service/store'.addDBaseURl();
  static String searchURL = '/user/doctor/search'.addDBaseURl();
  static String logOutURL = '/user/logout'.addDBaseURl();

/*================================*/
  /*dashboard url*/
  static String dashboardURL = '/user/dashboard'.addBaseURl();

  //payment gateway
  static String paymentURL = '/user/payment-gateway'.addDBaseURl();
  static String appointmentConfirmURL = '/user/confirm'.addDBaseURl();
}
