import '../../backend/local_storage/local_storage.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import 'app_setting_controller.dart';

class OnBoardScreenController extends GetxController {


 final appSettingsController = Get.put(AppSettingsController());



  @override
  void onClose() {
    Get.delete<OnBoardScreenController>();
    super.onClose();
  }

  var selectedPageIndex = 0.obs;

  // navigate to the sign in screen
  pageNavigate() {
    LocalStorage.saveOnboardDoneOrNot(isOnBoardDone: true);
    LocalStorage.saveGuestUser(isGuest: true);
    Get.toNamed(Routes.dashboardScreen);
  }

 
}