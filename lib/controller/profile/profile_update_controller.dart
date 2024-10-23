import '../../backend/local_storage/local_storage.dart';
import '../../backend/model/common/common_success_model.dart';
import '../../backend/model/profile/profile_model.dart';
import '../../backend/services/api_endpoint.dart';
import '../../backend/services/api_services.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/others/profile_image_picker.dart';

class ProfileUpdateController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final countryController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();

  final imageController = Get.put(InputImageController());

  RxString selectedCountryCode = Strings.numberCode.obs;
  RxString selectedCountry = ''.obs;
  RxString selectedCountry2 = Strings.bangladesh.obs;
 

  @override
  void onInit() {
    LocalStorage.getIsGuest() ? null : getProfile();
    super.onInit();
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late ProfileModel _profileModel;

  ProfileModel get profileModel => _profileModel;

  Future<ProfileModel> getProfile() async {
    _isLoading.value = true;
    update();
    await ApiServices.profileApi().then((value) {
      _profileModel = value!;
      final data = _profileModel.data.userInfo;
      firstNameController.text = data.firstname;
      lastNameController.text = data.lastname;
      addressController.text = data.address;
      cityController.text = data.city;
      stateController.text = data.state;
      zipCodeController.text = data.zip;
      selectedCountryCode.value = data.mobileCode;
      phoneNumberController.text = data.mobile;
      selectedCountry.value = data.country??Strings.selectCountry;


      var image = data.image;
      var userImage = "";

      LocalStorage.saveEmail(email: data.email.toString());

      LocalStorage.saveUsername(
          userName: data.username.toString());

      if (image == null) {
        userImage =
        "${ApiEndpoint.mainDomain}/${_profileModel.data.imagePaths.defaultImage}";

        LocalStorage.saveImage(image: userImage);
      } else {
        userImage =
        "${ApiEndpoint.mainDomain}/${_profileModel.data.imagePaths.pathLocation}/$image";
        LocalStorage.saveImage(image: userImage);
      }

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _profileModel;
  }

  final _isUpdateLoading = false.obs;

  bool get isUpdateLoading => _isUpdateLoading.value;
  late CommonSuccessModel _profileUpdateModel;

  CommonSuccessModel get profileUpdateModel => _profileUpdateModel;

  // --------------------------- Api function ----------------------------------
  // Profile update process without image
  Future<CommonSuccessModel> profileUpdateWithOutImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'country': selectedCountry.value,
      'mobile_code': selectedCountryCode.value,
      'mobile': phoneNumberController.text,
      'state': stateController.text,
      'zip': zipCodeController.text,
      'address': addressController.text,
      'city': cityController.text,
    };

    await ApiServices.updateProfileWithoutImageApi(body: inputBody)
        .then((value) {
      _profileUpdateModel = value!;
      Get.offAllNamed(Routes.dashboardScreen);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isUpdateLoading.value = false;
    update();
    return _profileUpdateModel;
  }

  // Profile update process with image
  Future<CommonSuccessModel> profileUpdateWithImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, String> inputBody = {
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'country': selectedCountry.value,
      'mobile_code': selectedCountryCode.value,
      'mobile': phoneNumberController.text,
      'state': stateController.text,
      'zip': zipCodeController.text,
      'address': addressController.text,
      'city': cityController.text,
    };

    await ApiServices.updateProfileWithImageApi(
      body: inputBody,
      filepath: imageController.imagePath.value,
    ).then((value) {
      _profileUpdateModel = value!;
      Get.offAllNamed(Routes.dashboardScreen);

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isUpdateLoading.value = false;
    update();
    return _profileUpdateModel;
  }
}
