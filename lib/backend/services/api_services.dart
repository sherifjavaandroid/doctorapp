// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../backend_utils/api_method.dart';
import '../backend_utils/custom_snackbar.dart';
import '../backend_utils/logger.dart';
import '../local_storage/local_storage.dart';
import '../model/auth/basic_setting_model.dart';
import '../model/auth/forgot_password_common_model.dart';
import '../model/auth/signin_model.dart';
import '../model/auth/signup_model.dart';
import '../model/categories/branches_model.dart';
import '../model/categories/find_doctor/appointment_model.dart';
import '../model/categories/find_doctor/automatic_gateway_model.dart';
import '../model/categories/find_doctor/doctor_info_model.dart';
import '../model/categories/find_doctor/doctor_list_model.dart';
import '../model/categories/find_doctor/get_payment_gateway_model.dart';
import '../model/categories/health_package_model.dart';
import '../model/categories/home_service_get_model.dart';
import '../model/common/common_success_model.dart';
import '../model/dashbaord/dashboard_model.dart';
import '../model/drawer/history_model.dart';
import '../model/drawer/home_service_history_model.dart';
import '../model/investigation/investigation_list_model.dart';
import '../model/profile/profile_model.dart';
// ignore: depend_on_referenced_packages
import '/language/language_controller.dart';
import '/utils/basic_widget_imports.dart';
import 'api_endpoint.dart';

final log = logger(ApiServices);

class ApiServices {
  static var client = http.Client();

  //! basic setting model

  static Future<BasicSettingModel?> basicSettingApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.basicURL,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        BasicSettingModel basicSettingModel =
            BasicSettingModel.fromJson(mapResponse);
        // CustomSnackBar.success(profileModel.message.success.first.toString());
        return basicSettingModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from  basic api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

//Login Api method
  static Future<SignInModel?> signInApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.loginURL,
        body,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        SignInModel loginModel = SignInModel.fromJson(mapResponse);
        // CustomSnackBar.success(loginModel.message.success.first.toString());
        return loginModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from sign in api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));

      return null;
    }
    return null;
  }

//SignUp Api method
  static Future<SignUpModel?> signUpApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.signUpURL,
        body,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        SignUpModel signUpModel = SignUpModel.fromJson(mapResponse);
        CustomSnackBar.success(signUpModel.message.success.first.toString());
        return signUpModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from sign up api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //email verification Api method
  static Future<CommonSuccessModel?> emailVerificationApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.emailVerificationURL,
        body,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);
        // if(kDebugMode){
        //   CustomSnackBar.success(
        //       commonSuccessModel.message.success.first.toString());
        // }
        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from email verification api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //sign up resend otp Api method
  static Future<CommonSuccessModel?> signUpResendOtpApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.signUpResendOtpURL,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(
            commonSuccessModel.message!.success!.first.toString());
        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from sign Up resend otp api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //Forgot Password Otp Api method
  static Future<ForgotPasswordCommonModel?> forgotPasswordEmailApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.forgotPasswordOtpURL,
        body,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        ForgotPasswordCommonModel forgotPasswordCommonModel =
            ForgotPasswordCommonModel.fromJson(mapResponse);
        CustomSnackBar.success(
            forgotPasswordCommonModel.message!.success!.first.toString());
        return forgotPasswordCommonModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from forgot password email api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //Forgot Password resend Otp Api method
  static Future<ForgotPasswordCommonModel?> forgotPasswordResendOtpApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.forgotPasswordResendOtpURL,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        ForgotPasswordCommonModel forgotPasswordCommonModel =
            ForgotPasswordCommonModel.fromJson(mapResponse);
        CustomSnackBar.success(
            forgotPasswordCommonModel.message!.success!.first.toString());
        return forgotPasswordCommonModel;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from forgot password resend otp api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //Forgot Password Otp Api method
  static Future<ForgotPasswordCommonModel?> forgotPasswordVerifyOtpApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.forgotPasswordVerifyOtpURL,
        body,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        ForgotPasswordCommonModel forgotPasswordCommonModel =
            ForgotPasswordCommonModel.fromJson(mapResponse);
        CustomSnackBar.success(
            forgotPasswordCommonModel.message!.success!.first.toString());
        return forgotPasswordCommonModel;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from forgot password verify otp api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //reset password Api method
  static Future<CommonSuccessModel?> resetPasswordApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).post(
        ApiEndpoint.resetPasswordURL,
        body,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(
        //     commonSuccessModel.message.success.first.toString());
        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from reset password api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //!investigation

  static Future<InvestigationListModel?> investigationApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.investigationListURL,
        code: 200,
        duration: 20,
        showResult: true,
      );
      if (mapResponse != null) {
        InvestigationListModel investigationListModel =
            InvestigationListModel.fromJson(mapResponse);
        return investigationListModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from  investigation api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //!healthPackageApi
  static Future<HealthPackageModel?> healthPackageApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.healthPackageURL,
        code: 200,
        duration: 20,
        showResult: true,
      );
      if (mapResponse != null) {
        HealthPackageModel healthPackageModel =
            HealthPackageModel.fromJson(mapResponse);
        return healthPackageModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from  health package api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }
//!branchesApi

  static Future<BranchesModel?> branchesApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.branchesListURL,
        code: 200,
        duration: 20,
        showResult: true,
      );
      if (mapResponse != null) {
        BranchesModel branchesModel = BranchesModel.fromJson(mapResponse);
        return branchesModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from  branches api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //! dashboard
  static Future<DashboardModel?> dashboardApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.dashboardURL,
        code: 200,
        duration: 30,
        showResult: true,
      );
      if (mapResponse != null) {
        DashboardModel addMoneyInfoModel = DashboardModel.fromJson(mapResponse);
        // CustomSnackBar.success(profileModel.message.success.first.toString());
        return addMoneyInfoModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from add dashboard api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //! profile get
  static Future<ProfileModel?> profileApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.profileURL,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        ProfileModel profileModel = ProfileModel.fromJson(mapResponse);
        // CustomSnackBar.success(profileModel.message.success.first.toString());
        return profileModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from profile api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

// !  profile update Api method no image
  static Future<CommonSuccessModel?> updateProfileWithoutImageApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false)
          .post(ApiEndpoint.profileUpdateURL, body, code: 200);
      if (mapResponse != null) {
        CommonSuccessModel updateProfileModel =
            CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(
            updateProfileModel.message!.success!.first.toString());
        return updateProfileModel;
      }
    } catch (e) {
      log.e('err from profile update api service ==> $e');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //! profile update api
  static Future<CommonSuccessModel?> updateProfileWithImageApi(
      {required Map<String, String> body, required String filepath}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipart(
        ApiEndpoint.profileUpdateURL,
        body,
        filepath,
        'image',
        code: 200,
      );

      if (mapResponse != null) {
        CommonSuccessModel profileUpdateModel =
            CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(
            profileUpdateModel.message!.success!.first.toString());
        return profileUpdateModel;
      }
    } catch (e) {
      log.e('err from profile update api service ==> $e');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //!change password Api method
  static Future<CommonSuccessModel?> changePasswordApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.changePasswordURL,
        body,
        code: 200,
        duration: 15,
        showResult: true,
      );
      if (mapResponse != null) {
        CommonSuccessModel commonSuccessModel =
            CommonSuccessModel.fromJson(mapResponse);
        CustomSnackBar.success(
            commonSuccessModel.message!.success!.first.toString());
        return commonSuccessModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from change password api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

//! history
  static Future<HistoryModel?> historyApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.historyURL,
        code: 200,
        duration: 30,
        showResult: true,
      );
      if (mapResponse != null) {
        HistoryModel historyModel = HistoryModel.fromJson(mapResponse);
        return historyModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from add history api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

//! service history
  static Future<ServiceHistoryModel?> serviceHistoryApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.serviceHistoryURL,
        code: 200,
        duration: 30,
        showResult: true,
      );
      if (mapResponse != null) {
        ServiceHistoryModel historyModel =
            ServiceHistoryModel.fromJson(mapResponse);
        return historyModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from add home history api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //! lout out api
  static Future<CommonSuccessModel?> logOutApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.logOutURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel logoutModel =
            CommonSuccessModel.fromJson(mapResponse);

        return logoutModel;
      }
    } catch (e) {
      log.e('err from log Out api service ==> $e');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //!find doctor list
  static Future<FindDoctorListModel?> findDoctorListApi(
    int branchId,
    int departmentId,
  ) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        branchId == 0 || departmentId == 0
            ? ApiEndpoint.findDoctorListURL
            : "${ApiEndpoint.findDoctorListURL}?branch=$branchId&department=$departmentId",
        code: 200,
        duration: 25,
        showResult: true,
      );
      if (mapResponse != null) {
        FindDoctorListModel findDoctorListModel =
            FindDoctorListModel.fromJson(mapResponse);
        return findDoctorListModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from add find doctor api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //!doctor info model
  static Future<DoctorInfoModel?> doctorInfoApi(slug) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        "${ApiEndpoint.doctorInfoURL}$slug",
        code: 200,
        duration: 25,
        showResult: true,
      );
      if (mapResponse != null) {
        DoctorInfoModel doctorInfoModel = DoctorInfoModel.fromJson(mapResponse);
        return doctorInfoModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from add info doctor api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //!doctor appointment
  static Future<AppointmentModel?> appointmentAPi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(
              isBasic: LocalStorage.isLoggedIn() == true ? false : true)
          .post(ApiEndpoint.appointmentURL, body, code: 200);
      if (mapResponse != null) {
        AppointmentModel appointmentModel =
            AppointmentModel.fromJson(mapResponse);
        // CustomSnackBar.success(
        //     appointmentModel.message!.success!.first.toString());
        return appointmentModel;
      }
    } catch (e) {
      log.e('err from appointment Model api service ==> $e');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //! schedule info
  static Future<HomeServiceGetModel?> scheduleApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.scheduleURL,
        code: 200,
        duration: 25,
        showResult: true,
      );
      if (mapResponse != null) {
        HomeServiceGetModel homeServiceGetModel =
            HomeServiceGetModel.fromJson(mapResponse);
        return homeServiceGetModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from add schedule api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //! home service
  static Future<CommonSuccessModel?> homeServiceApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(
              isBasic: LocalStorage.isLoggedIn() == true ? false : true)
          .post(ApiEndpoint.homeServiceURL, body, code: 200);
      if (mapResponse != null) {
        CommonSuccessModel homeServiceModel =
            CommonSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(
        //     appointmentModel.message!.success!.first.toString());
        return homeServiceModel;
      }
    } catch (e) {
      log.e('err from home service api service ==> $e');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  // search api
  static Future<CommonSuccessModel?> searchDoctorApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true)
          .post(ApiEndpoint.searchURL, body, code: 200);
      if (mapResponse != null) {
        CommonSuccessModel searchModel =
            CommonSuccessModel.fromJson(mapResponse);
        // CustomSnackBar.success(
        //     appointmentModel.message!.success!.first.toString());
        return searchModel;
      }
    } catch (e) {
      log.e('err from home search api service ==> $e');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //! payment info model
  static Future<PaymentGatewayModel?> paymentGatewayAPi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.paymentURL,
        code: 200,
        duration: 20,
        showResult: true,
      );
      if (mapResponse != null) {
        PaymentGatewayModel paymentGatewayModel =
            PaymentGatewayModel.fromJson(mapResponse);
        return paymentGatewayModel;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from payment gateway model api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  //confirm payment
  static Future<CommonSuccessModel?> appointmentConfirmApi(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.appointmentConfirmURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        CommonSuccessModel logoutModel =
            CommonSuccessModel.fromJson(mapResponse);

        return logoutModel;
      }
    } catch (e) {
      log.e('err from appointment confirm api service ==> $e');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }

  ///*automatic Submit  transfer process api
  static Future<SubmitAutomaticGatewayModel?> automaticSubmitApiProcess(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.appointmentConfirmURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        SubmitAutomaticGatewayModel result =
            SubmitAutomaticGatewayModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from automatic submit process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error(Get.find<LanguageController>()
          .getTranslation(Strings.somethingwentwrong));
      return null;
    }
    return null;
  }
}
