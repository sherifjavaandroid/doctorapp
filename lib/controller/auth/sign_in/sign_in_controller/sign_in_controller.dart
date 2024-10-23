import 'package:adoctor/backend/services/api_endpoint.dart';

import '../../../../backend/local_storage/local_storage.dart';
import '../../../../backend/model/auth/signin_model.dart';
import '../../../../backend/services/api_services.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isFromLogin = false;
  RxBool isSelected = true.obs;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // api loading process indicator variable
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  //model defined
  late SignInModel _signInModel;

  SignInModel get signInModel => _signInModel;

  /*--------------------------- Api function start ----------------------------------*/
  // Sign in process function
  Future<SignInModel> signInProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    await ApiServices.signInApi(body: inputBody).then((value) {
      _signInModel = value!;

      if (_signInModel.data!.user!.emailVerified == 0) {
        isFromLogin = true;
        _goToEmailVerification();
      } else {
        var image = _signInModel.data!.user!.image;
        var userImage = "";

        LocalStorage.saveEmail(
            email: _signInModel.data!.user!.email!.toString());

        LocalStorage.saveUsername(
            userName: _signInModel.data!.user!.username.toString());

        if (image == null) {
          userImage =
              "${ApiEndpoint.mainDomain}/${_signInModel.data!.defaultImage}";

          LocalStorage.saveImage(image: userImage);
        } else {
          userImage =
              "${ApiEndpoint.mainDomain}/${_signInModel.data!.imagePath}/$image";
          LocalStorage.saveImage(image: userImage);
        }
        _goToSavedUser(_signInModel);
      }
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _signInModel;
  }

  /*--------------------------- Api function end ----------------------------------*/

  _goToEmailVerification() {
    LocalStorage.saveToken(token: signInModel.data!.token!);
    Get.toNamed(Routes.signUpEmailOtpVerificationScreen);
  }

  _goToSavedUser(SignInModel loginModel) {
    LocalStorage.removeGuestUser();
    // LocalStorage.saveGuestUser(isGuest: false);

    LocalStorage.saveToken(token: loginModel.data!.token!);
    LocalStorage.isLoginSuccess(isLoggedIn: true);
    LocalStorage.isLoggedIn();
    LocalStorage.saveEmail(email: emailController.text);
    goToDashboardScreen();
  }

  goToResetPasswordScreen() {
    Get.toNamed(Routes.resetPasswordScreen);
  }

  goToSignUpScreen() {
    Get.toNamed(Routes.signUpScreen);
  }

  goToDashboardScreen() {
    Get.toNamed(Routes.dashboardScreen);
  }

  goToSignInScreen() {
    Get.toNamed(Routes.signInScreen);
  }
}
