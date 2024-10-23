import '../../backend/model/dashbaord/dashboard_model.dart';
import '../../backend/services/api_services.dart';
import '../../language/language_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../profile/profile_update_controller.dart';

class DashboardController extends GetxController {
  final searchTextController = TextEditingController();
  final profileUpdateController = Get.put(ProfileUpdateController());
  final languageController = Get.put(LanguageController());

  //
  RxBool isShowDoctor = false.obs;

  RxString selectBranch = ''.obs;
  RxString selectDepartment = "".obs;
  RxInt branchId = 0.obs;
  RxInt departmentId = 0.obs;

  @override
  void onInit() {
    getDashboard();
    super.onInit();
  }

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  late DashboardModel _dashboardModel;

  DashboardModel get dashboardModel => _dashboardModel;

  Future<DashboardModel> getDashboard() async {
    profileUpdateController.getProfile();
    _isLoading.value = true;
    update();

    await ApiServices.dashboardApi().then((value) {
      _dashboardModel = value!;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    selectDepartment.value =
        languageController.getTranslation(Strings.selectDepartment);
    _isLoading.value = false;
    update();
    return _dashboardModel;
  }

  Rx<List<DoctorList>> foundDoctor = Rx<List<DoctorList>>([]);

  @override
  void onClose() {}
  void filterDoctors(String? value) {
    List<DoctorList> results = [];
    if (value!.isEmpty) {
      results = _dashboardModel.data.doctorList;
    } else {
      results = _dashboardModel.data.doctorList
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    }

    foundDoctor.value = results;
  }
}
