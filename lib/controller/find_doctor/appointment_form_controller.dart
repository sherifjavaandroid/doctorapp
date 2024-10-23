import 'package:adoctor/utils/basic_widget_imports.dart';

import '../../backend/model/categories/find_doctor/appointment_model.dart';
import '../../backend/model/categories/find_doctor/automatic_gateway_model.dart';
import '../../backend/model/categories/find_doctor/get_payment_gateway_model.dart';
import '../../backend/model/common/common_success_model.dart';
import '../../backend/services/api_services.dart';
import '../../language/language_controller.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import 'doctor_profile_controller.dart';

class AppointmentController extends GetxController {
  final patientNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final massageController = TextEditingController();
  final countryController = TextEditingController();
  final dOBController = TextEditingController();
  final nationalityController = TextEditingController();
  final controller = Get.put(DoctorProfileController());
  RxInt schedule = 0.obs;
  RxString date = "".obs;
  RxString day = "".obs;
  RxString month = "".obs;
  RxString year = "".obs;
  RxString formTime = "".obs;
  RxString toTime = "".obs;
  RxString selectedGateway =Get.find<LanguageController>().getTranslation(Strings.onlinePayment).obs;
  RxString selectedAlias = "".obs;
  RxString confirmSlug = "".obs;
  RxBool isCashPayment = false.obs;
  RxBool dropdownSelected = false.obs;
  RxInt selectedColor = 0.obs;
  void changeColor(int index) {
    selectedColor.value = index;
  }

  @override
  void onInit() {
    getPaymentGatewayData();
    super.onInit();
  }

  List<PaymentGateway> currencyList = [];
  // ----------------------------PaymentGatewayModel ------------------
  // api loading process indicator variable
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  late PaymentGatewayModel _paymentGatewayModel;

  PaymentGatewayModel get paymentGatewayModel => _paymentGatewayModel;

  // --------------------------- Api function ----------------------------------
  // get addMoneyPaymentGateway data function
  Future<PaymentGatewayModel> getPaymentGatewayData() async {
    _isLoading.value = true;
    update();

    await ApiServices.paymentGatewayAPi().then((value) {
      _paymentGatewayModel = value!;
      for (var gateways in _paymentGatewayModel.data.paymentGateway) {
        currencyList.add(
          PaymentGateway(
            id: gateways.id,
            paymentGatewayId: gateways.paymentGatewayId,
            name: gateways.name,
            alias: gateways.alias,
            currencyCode: gateways.currencyCode,
            currencySymbol: gateways.currencySymbol,
            minLimit: gateways.minLimit,
            maxLimit: gateways.maxLimit,
            percentCharge: gateways.percentCharge,
            fixedCharge: gateways.fixedCharge,
            rate: gateways.rate,
            createdAt: gateways.createdAt,
            updatedAt: gateways.updatedAt,
            image: gateways.image,
          ),
        );
      }
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
      update();
    });

    return _paymentGatewayModel;
  }

  final _isUpdateLoading = false.obs;

  bool get isUpdateLoading => _isUpdateLoading.value;
  late AppointmentModel _appointmentModel;

  AppointmentModel get appointmentModel => _appointmentModel;

  // --------------------------- Api function ----------------------------------
  //  appointment process
  Future<AppointmentModel> appointmentProcess() async {
    _isUpdateLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'doctor': controller.controller.slug.value,
      'schedule': schedule.value.toString(),
      'name': patientNameController.text,
      'phone': mobileController.text,
      'email': emailController.text,
      'age': "${ageController.text} ${ageMethod.value}",
      'type': appointmentMethod.value,
      'gender': genderMethod.value,
    };

    await ApiServices.appointmentAPi(body: inputBody).then((value) {
      _appointmentModel = value!;
      confirmSlug.value = appointmentModel.data.slug;

      Get.toNamed(Routes.findDoctorPreviewScreen);

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isUpdateLoading.value = false;
    update();
    return _appointmentModel;
  }

// appointment confirm

  final _isConfirmLoading = false.obs;
  bool get isConfirmLoading => _isConfirmLoading.value;

  late CommonSuccessModel _appointmentConfirmModel;

  CommonSuccessModel get appointmentConfirmModel => _appointmentConfirmModel;

  // --------------------------- Api function ----------------------------------
  //  appointment process
  Future<CommonSuccessModel> appointmentConfirmProcess() async {
    _isConfirmLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'payment_method': "Cash Payment",
      'slug': confirmSlug.value,
    };
    await ApiServices.appointmentConfirmApi(body: inputBody).then((value) {
      _appointmentConfirmModel = value!;
      Get.offAllNamed(Routes.commonSuccessScreen, arguments: [
        Strings.appointmentSuccess,
        Routes.dashboardScreen,
      ]);
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isConfirmLoading.value = false;
    update();
    return _appointmentConfirmModel;
  }

//! automatic gateway
  /// >> set loading process & automatic payment Info Model
  final _isAutomaticLoading = false.obs;

  /// >> get loading process & automatic payment Info Model
  bool get isAutomaticLoading => _isAutomaticLoading.value;

  late SubmitAutomaticGatewayModel _submitAutomaticGatewayModel;
  SubmitAutomaticGatewayModel get submitAutomaticGatewayModel =>
      _submitAutomaticGatewayModel;

  ///* automatic  api process start
  Future<SubmitAutomaticGatewayModel> paymentAutomaticProcess() async {
    _isAutomaticLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'payment_method': selectedAlias.value,
      'slug': confirmSlug.value,
    };

    await ApiServices.automaticSubmitApiProcess(body: inputBody).then((value) {
      _submitAutomaticGatewayModel = value!;
     
      Get.toNamed(Routes.webScreen);
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isAutomaticLoading.value = false;
    update();
    return _submitAutomaticGatewayModel;
  }

  RxString appointmentMethod = Get.find<LanguageController>().getTranslation(Strings.news).obs;
  RxString genderMethod = Get.find<LanguageController>().getTranslation(Strings.male).obs;

  List<String> appointmentTypeList = [
   Get.find<LanguageController>().getTranslation( Strings.news),
    Get.find<LanguageController>().getTranslation(Strings.report),
    Get.find<LanguageController>().getTranslation(Strings.followup),
  ];

  List<String> genderList = [
   Get.find<LanguageController>().getTranslation( Strings.male),
   Get.find<LanguageController>().getTranslation( Strings.female),
   Get.find<LanguageController>().getTranslation( Strings.other),
  ];

  RxString ageMethod = Strings.years.obs;
  List<SendMoneyModel> ageList = [
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

class SendMoneyModel {
  final String title;

  SendMoneyModel({
    required this.title,
  });
}
