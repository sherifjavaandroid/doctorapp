import 'dart:async';

import 'package:get/get.dart';

import '../../backend/local_storage/local_storage.dart';
import '../../language/language_controller.dart';
import '../../routes/routes.dart';

final languageController = Get.find<LanguageController>();

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    _goToScreen();
  }

  _goToScreen() async {
    Timer(
      const Duration(seconds: 6),
      () {
        if (!languageController.isLoading) {
          LocalStorage.isLoggedIn()
              ? Get.offAndToNamed(Routes.dashboardScreen)
              : Get.offAndToNamed(
                  LocalStorage.isOnBoardDone()
                      ? Routes.signInScreen
                      : Routes.onboardScreen,
                );
        }
      },
    );
  }
}
