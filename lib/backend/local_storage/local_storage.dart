import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../backend_utils/constants.dart';

const String idKey = "idKey";
const String branchIdKey = "branchIdKey";
const String departmentIdKey = "departmentIdKey";

const String firstNameKey = "firstNameKey";

const String lastNameKey = "lastNameKey";

const String nameKey = "nameKey";

const String tokenKey = "tokenKey";

const String emailKey = "emailKey";

const String imageKey = "imageKey";

const String appLogoKey = "appLogoKey";

const String userNameKey = "userNameKey";

const String showAdKey = "showAdKey";

const String isLoggedInKey = "isLoggedInKey";

const String isDataLoadedKey = "isDataLoadedKey";

const String isOnBoardDoneKey = "isOnBoardDoneKey";

const String isScheduleEmptyKey = "isScheduleEmptyKey";

const String isSuccessKey = "isSuccessKey";

const String language = "language";

const String smallLanguage = "smallLanguage";

const String capitalLanguage = "capitalLanguage";

const String isLanguageSetByUserKey = "isLanguageSetByUser";

//! **************************************
const String onboardTitleKey = "onboardTitleKey";
const String onboardSubTitleKey = "onboardSubTitleKey";
const String logoDarkImageKey = "logoDarkImageKey";
const String logoLightImageKey = "logoLightImageKey";
const String splashScreenImageKey = "splashScreenImageKey";
const String onboardScreenImageKey = "onboardScreenImageKey";
const String userId = "userId";
const String guestUser = "guestUser";

/*token section*/
const String forgotPasswordToken = "forgotPasswordToken";

class LocalStorage {
  static Future<void> saveId({required String id}) async {
    final box = GetStorage();

    await box.write(idKey, id);
  }

  static Future<void> saveBranchId({required int id}) async {
    final box = GetStorage();
    await box.write(branchIdKey, id);
  }
  static Future<void> saveDepartmentId({required int id}) async {
    final box = GetStorage();
    await box.write(departmentIdKey, id);
  }

  static Future<void> saveFirstName({required String firstName}) async {
    final box = GetStorage();

    await box.write(firstNameKey, firstName);
  }

  static Future<void> saveLastName({required String lastName}) async {
    final box = GetStorage();

    await box.write(lastNameKey, lastName);
  }

  static Future<void> saveName({required String name}) async {
    final box = GetStorage();

    await box.write(nameKey, name);
  }

  static Future<void> saveEmail({required String email}) async {
    final box = GetStorage();

    await box.write(emailKey, email);
  }

  static Future<void> saveToken({required String token}) async {
    final box = GetStorage();

    await box.write(tokenKey, token);
  }

  static Future<void> saveImage({required String image}) async {
    final box = GetStorage();

    await box.write(imageKey, image);
  }

  static Future<void> saveUsername({required String userName}) async {
    final box = GetStorage();

    await box.write(userNameKey, userName);
  }

  static Future<void> saveSuccess({required String success}) async {
    final box = GetStorage();

    await box.write(isSuccessKey, success);
  }

  static Future<void> isLoginSuccess({required bool isLoggedIn}) async {
    final box = GetStorage();

    await box.write(isLoggedInKey, isLoggedIn);
  }

  static Future<void> dataLoaded({required bool isDataLoad}) async {
    final box = GetStorage();

    await box.write(isDataLoadedKey, isDataLoad);
  }

// ! ***********************************************************************
  static Future<void> saveLogoDarkImage({required String image}) async {
    final box = GetStorage();
    await box.remove(logoDarkImageKey);

    await box.write(logoDarkImageKey, image);
  }

  static Future<void> saveSplashScreenImage({required String image}) async {
    final box = GetStorage();

    await box.write(splashScreenImageKey, image);
  }

  static Future<void> saveAppLogo({required String image}) async {
    final box = GetStorage();

    await box.write(appLogoKey, image);
  }

  static Future<void> saveOnboardScreenImage({required String image}) async {
    final box = GetStorage();

    await box.write(onboardScreenImageKey, image);
  }

  static Future<void> saveOnBoardTitle({required String title}) async {
    final box = GetStorage();

    await box.write(onboardTitleKey, title);
  }

  static Future<void> saveOnBoardSubTitle({required String subTitle}) async {
    final box = GetStorage();

    await box.write(onboardSubTitleKey, subTitle);
  }

  static Future<void> saveGuestUser({required bool isGuest}) async {
    final box = GetStorage();

    await box.write(guestUser, isGuest);
  }

  static Future<void> setUserSelectedLanguage(
      {required bool isUserSelectedLanguage}) async {
    final box = GetStorage();

    await box.write(isLanguageSetByUserKey, isUserSelectedLanguage);
  }

  static Future<void> scheduleEmpty({required bool isScheduleEmpty}) async {
    final box = GetStorage();

    await box.write(isScheduleEmptyKey, isScheduleEmpty);
  }

  static Future<void> showAdYes({required bool isShowAdYes}) async {
    final box = GetStorage();

    await box.write(showAdKey, isShowAdYes);
  }

  static Future<void> saveOnboardDoneOrNot(
      {required bool isOnBoardDone}) async {
    final box = GetStorage();

    await box.write(isOnBoardDoneKey, isOnBoardDone);
  }

  static Future<void> saveLanguage({
    required String langSmall,
    required String langCap,
    required String languageName,
  }) async {
    final box1 = GetStorage();
    final box2 = GetStorage();
    final box3 = GetStorage();
    languageStateName = languageName;
    var locale = Locale(langSmall, langCap);
    Get.updateLocale(locale);
    await box1.write(smallLanguage, langSmall);
    await box2.write(capitalLanguage, langCap);
    await box3.write(language, languageName);
  }

  // ! ***********************************************************************
  /*token section*/
  static Future<void> saveForgotPasswordToken(
      {required String isForgotPasswordToken}) async {
    final box = GetStorage();

    await box.write(forgotPasswordToken, isForgotPasswordToken);
  }

  static List getLanguage() {
    String small = GetStorage().read(smallLanguage) ?? 'en';
    String capital = GetStorage().read(capitalLanguage) ?? 'EN';
    String languages = GetStorage().read(language) ?? 'English';
    return [small, capital, languages];
  }

  static Future<void> changeLanguage() async {
    final box = GetStorage();
    await box.remove(language);
  }

  static String? getId() {
    return GetStorage().read(idKey);
  }

  static String? getFirstName() {
    return GetStorage().read(firstNameKey);
  }

  static String? getLastName() {
    return GetStorage().read(lastNameKey);
  }

  static String? getName() {
    return GetStorage().read(nameKey);
  }

  static String? getEmail() {
    return GetStorage().read(emailKey) ?? "";
  }

  static String? getToken() {
    var rtrn = GetStorage().read(tokenKey);

    debugPrint(rtrn == null ? "##Token is null###" : "");

    return rtrn;
  }

  static String? getImage() {
    return GetStorage().read(imageKey) ?? "";
  }

  static String? getAppLogo() {
    return GetStorage().read(appLogoKey) ?? "";
  }

  static String? getUsername() {
    return GetStorage().read(userNameKey) ?? "";
  }

  static String? getSuccess() {
    return GetStorage().read(isSuccessKey);
  }
  
  static int getBranchId() {
    return GetStorage().read(branchIdKey)??0;
  }
  static int getDepartment() {
    return GetStorage().read(departmentIdKey)??0;
  }

  static bool isLoggedIn() {
    return GetStorage().read(isLoggedInKey) ?? false;
  }

  static bool isUserSelectedLanguage() {
    return GetStorage().read(isLanguageSetByUserKey) ?? false;
  }

  static bool isDataLoaded() {
    return GetStorage().read(isDataLoadedKey) ?? false;
  }

  static bool isScheduleEmpty() {
    return GetStorage().read(isScheduleEmptyKey) ?? false;
  }

  static bool isOnBoardDone() {
    return GetStorage().read(isOnBoardDoneKey) ?? false;
  }

  static bool showAdPermission() {
    return GetStorage().read(showAdKey) ?? true;
  }

  // ! ***********************************************************************
  /*token section*/
  static String getForgotPasswordToken() {
    return GetStorage().read(forgotPasswordToken) ?? '';
  }

  // ! ************************************

  static String getSplashScreenImage() {
    return GetStorage().read(splashScreenImageKey) ?? '';
  }

  static String getOnboardScreenImage() {
    return GetStorage().read(onboardScreenImageKey) ?? '';
  }

  static String getOnboardTitle() {
    return GetStorage().read(onboardTitleKey) ?? '';
  }

  static String getOnboardSubTitle() {
    return GetStorage().read(onboardSubTitleKey) ?? '';
  }

//! is guest
  static bool getIsGuest() {
    return GetStorage().read(guestUser) ?? false;
  }

  static Future<void> logout() async {
    final box = GetStorage();

    await box.remove(idKey);
    await box.remove(firstNameKey);
    await box.remove(lastNameKey);
    await box.remove(nameKey);
    await box.remove(emailKey);
    await box.remove(imageKey);
    await box.remove(isLoggedInKey);
    await box.remove(isOnBoardDoneKey);
    await box.remove(tokenKey);
    await box.remove(forgotPasswordToken);
  }

  static Future<void> removeToken() async {
    final box = GetStorage();

    await box.remove(forgotPasswordToken);
    await box.remove(tokenKey);
    await box.remove(guestUser);
  }  
  
  static Future<void> removeDoctorFilter() async {
    final box = GetStorage();
    await box.remove(branchIdKey);
    await box.remove(departmentIdKey);
  }

  static Future<void> removeKey({required String key}) async {
    final box = GetStorage();

    await box.remove(key);
  }


  static Future<void> removeGuestUser() async {
    final box = GetStorage();

    await box.remove(guestUser);
  }
}
