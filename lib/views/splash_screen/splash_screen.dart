import 'package:adoctor/backend/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../backend/backend_utils/custom_loading_api.dart';
import '../../controller/settings/app_setting_controller.dart';
import '../../language/language_controller.dart';
import '../../utils/responsive_layout.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final controller = Get.put(AppSettingsController());
  final languageController = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Obx(
          () => controller.isLoading
              ? CustomLoadingAPI(color: Theme.of(context).primaryColor)
              : Center(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(
                        LocalStorage.getSplashScreenImage(),
                        fit: BoxFit.fill,
                      ),
                      Visibility(
                        visible: languageController.isLoading &&
                            controller.isVisible.value,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.sizeOf(context).height * 0.2,
                            left: MediaQuery.sizeOf(context).width * 0.15,
                            right: MediaQuery.sizeOf(context).width * 0.15,
                          ),
                          child: LinearProgressIndicator(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.8),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
