import '../../backend/model/common/common_success_model.dart';
import '../../backend/services/api_services.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';

class ChangePasswordController extends GetxController {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  final _isUpdateLoading = false.obs;
  bool get isUpdateLoading => _isUpdateLoading.value;

  late CommonSuccessModel _updatePasswordModel;

  CommonSuccessModel get depositMethodsModel => _updatePasswordModel;

  Future<CommonSuccessModel> changePasswordProcess({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
    required context,
  }) async {
    _isUpdateLoading.value = true;
    Map<String, String> inputBody = {
      'current_password': currentPassword,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
    await ApiServices.changePasswordApi(body: inputBody).then((value) {
      _updatePasswordModel = value!;
      _isUpdateLoading.value = false;
      update();
      Get.offAllNamed(Routes.dashboardScreen);
    }).catchError((onError) {
      log.e(onError);
    });
    _isUpdateLoading.value = false;
    update();
    return _updatePasswordModel;
  }
}
