import 'package:adoctor/language/language_controller.dart';

import '../../backend/model/categories/home_service_get_model.dart';
import '../../backend/model/common/common_success_model.dart';
import '../../backend/services/api_services.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../find_doctor/appointment_form_controller.dart';

class HomeServiceController extends GetxController {
  final patientNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final massageController = TextEditingController();
  final addressController = TextEditingController();

  final countryController = TextEditingController();
  final dOBController = TextEditingController();
  final nationalityController = TextEditingController();

  //
  RxString date = "".obs;
  RxString day = "".obs;
  RxString month = "".obs;
  RxString year = "".obs;
  RxInt schedule = 0.obs;
  RxString selectedType = "".obs;
RxList<String> selectedItems = RxList<String>();
  //
  RxInt selectedColor = 0.obs;
  void changeColor(int index) {
    selectedColor.value = index;
  }

  RxInt typeColor = 0.obs;
  void changeTypeColor(int index) {
    typeColor.value = index;
  }
RxList<int> selectedIndices = RxList<
      int>(); // Initialize a reactive list to keep track of selected indices

  // schedule get
  @override
  void onInit() {
    getSchedule();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late HomeServiceGetModel _scheduleModel;

  HomeServiceGetModel get scheduleModel => _scheduleModel;

  Future<HomeServiceGetModel> getSchedule() async {
    _isLoading.value = true;
    update();
    await ApiServices.scheduleApi().then((value) {
      _scheduleModel = value!;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return _scheduleModel;
  }

//home service post
  final _isUpdateLoading = false.obs;

  bool get isUpdateLoading => _isUpdateLoading.value;

  late CommonSuccessModel _homeServiceModel;

  CommonSuccessModel get homeServiceModel => _homeServiceModel;
  // --------------------------- Api function ----------------------------------
  // ! appointment process
  Future<CommonSuccessModel> homeServiceProcess() async {
    _isUpdateLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'name': patientNameController.text,
      'phone': mobileController.text,
      'email': emailController.text,
      'age': ageController.text,
      'age_type': ageMethod.value,
      'type': selectedType.value,
      'address': addressController.text,
      'gender': genderMethod.value,
      'schedule': "${day.value}, ${date.value} ${month.value} ${year.value}",
    };

    await ApiServices.homeServiceApi(body: inputBody).then((value) {
      _homeServiceModel = value!;
      Get.offAllNamed(Routes.commonSuccessScreen, arguments: [
        Strings.appointmentSuccess,
        Routes.dashboardScreen,
      ]);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isUpdateLoading.value = false;
    update();
    return _homeServiceModel;
  }
  //

  RxString appointmentMethod =
      Get.find<LanguageController>().getTranslation(Strings.news).obs;
  RxString genderMethod =
      Get.find<LanguageController>().getTranslation(Strings.male).obs;

  List<String> appointmentTypeList = [
    Get.find<LanguageController>().getTranslation(Strings.news),
    Get.find<LanguageController>().getTranslation(Strings.report),
    Get.find<LanguageController>().getTranslation(Strings.followup),
  ];
  List<String> genderList = [
    Get.find<LanguageController>().getTranslation(Strings.male),
    Get.find<LanguageController>().getTranslation(Strings.female),
    Get.find<LanguageController>().getTranslation(Strings.other),
  ];

  RxString ageMethod = Strings.years.obs;
  List<SendMoneyModel> agesList = [
    SendMoneyModel(
      title: Strings.years,
    ),
    SendMoneyModel(
      title: Strings.months,
    ),
    SendMoneyModel(
      title: Strings.days,
    ),
  ];
}
