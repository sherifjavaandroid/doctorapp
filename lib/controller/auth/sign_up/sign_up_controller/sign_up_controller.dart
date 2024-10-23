import '../../../../backend/local_storage/local_storage.dart';
import '../../../../backend/model/auth/signup_model.dart';
import '../../../../backend/services/api_services.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';

class SignUpController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  RxBool isSelected = true.obs;

  // dispose all controller while the screen destroy
  @override
  void dispose() {
    firstNameController.clear();
    lastNameController.clear();
    signUpEmailController.clear();
    signUpPasswordController.clear();
    super.dispose();
  }

  // api loading process indicator variable
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late SignUpModel _signUpModel;

  SignUpModel get signUpModel => _signUpModel;

  // --------------------------- Api function ----------------------------------
  // Sign up process function
  Future<SignUpModel> signUpProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': signUpEmailController.text,
      'password': signUpPasswordController.text,
      'policy': "on",
    };

    await ApiServices.signUpApi(body: inputBody).then((value) {
      _signUpModel = value!;
      LocalStorage.removeGuestUser();
      // LocalStorage.saveGuestUser(isGuest: false);
      LocalStorage.saveToken(token: signUpModel.data.token.toString());
      LocalStorage.saveEmail(email: signUpEmailController.text);
      goToSignUpEmailOtpVerificationScreen();
      LocalStorage.isLoginSuccess(isLoggedIn: true);
      LocalStorage.isLoggedIn();
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _signUpModel;
  }

  goToSignInScreen() {
    Get.toNamed(Routes.signInScreen);
  }

  goToSignUpEmailOtpVerificationScreen() {
    Get.toNamed(Routes.signUpEmailOtpVerificationScreen);
  }
}
