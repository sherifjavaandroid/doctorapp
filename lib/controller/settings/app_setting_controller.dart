import 'dart:async';

import '../../backend/local_storage/local_storage.dart';
import '../../backend/model/auth/basic_setting_model.dart';
import '../../backend/services/api_services.dart';
import '../../utils/basic_screen_imports.dart';

class AppSettingsController extends GetxController {
  final List<OnboardScreen> onboardScreen = [];
  RxString defLangKey = "".obs; // Default language is English
  RxBool isVisible = false.obs;
  RxString splashImagePath = ''.obs;
  @override
  void onInit() {
    getSplashAndOnboardData().then((value) {
      Timer(const Duration(seconds: 4), () {
        isVisible.value = true;
      });
    });
    super.onInit();
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late BasicSettingModel _appSettingsModel;

  BasicSettingModel get appSettingsModel => _appSettingsModel;

  Future<BasicSettingModel> getSplashAndOnboardData() async {
    _isLoading.value = true;
    update();

    await ApiServices.basicSettingApi().then((value) {
      _appSettingsModel = value!;

      saveInfo();

      update();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return _appSettingsModel;
  }

  saveInfo() {
    final data = _appSettingsModel.data!;

    final basicImagePath =
        '${data.appImagePath!.baseUrl}/${data.appImagePath!.pathLocation}/';
    final logoImagePath =
        '${data.basicSeetingsImagePaths!.baseUrl}/${data.basicSeetingsImagePaths!.pathLocation}/${data.basicSettings!.first.siteLogo}';

    LocalStorage.saveSplashScreenImage(
        image: basicImagePath + data.splashScreen!.first.splashScreenImage!);

    for (var element in _appSettingsModel.data!.onboardScreen!) {
      onboardScreen.add(
        OnboardScreen(
            id: element.id,
            title: element.title,
            subTitle: element.subTitle,
            image: "$basicImagePath/${element.image}",
            status: element.status,
            createdAt: element.createdAt),
      );
    }

    LocalStorage.saveAppLogo(image: logoImagePath);
    debugPrint(logoImagePath);
  }
}
