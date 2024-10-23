

import '../../backend/local_storage/local_storage.dart';
import '../../backend/model/categories/find_doctor/doctor_list_model.dart';
import '../../backend/model/common/common_success_model.dart';
import '../../backend/services/api_services.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../dashboard/dashboard_controller.dart';

class FindDoctorController extends GetxController {
  final searchBarController = TextEditingController();
  final controller = Get.put(DashboardController());
  RxString slug = "".obs;
  RxString name = "".obs;
  RxString doctorTitle = "".obs;

  @override
  void onInit() {
    getDoctorList(
      LocalStorage.getBranchId(),
      LocalStorage.getDepartment(),
    );
    super.onInit();
  }

//started doctor list  get method
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  late FindDoctorListModel _findDoctorListModel;

  FindDoctorListModel get findDoctorListModel => _findDoctorListModel;

  Future<FindDoctorListModel> getDoctorList(
    int branchId,
    int departmentId,
  ) async {
    _isLoading.value = true;
    update();

    await ApiServices.findDoctorListApi(branchId, departmentId).then((value) {
      _findDoctorListModel = value!;

      LocalStorage.removeDoctorFilter();
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return _findDoctorListModel;
  }

//started searching process
  final _isSearchLoading = false.obs;

  bool get isSearchLoading => _isSearchLoading.value;
  late CommonSuccessModel _searchModel;

  CommonSuccessModel get searchModel => _searchModel;

  //  search process
  Future<CommonSuccessModel> searchProcess() async {
    _isSearchLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'branch': controller.branchId.value,
      'department': controller.departmentId.value,
    };

    await ApiServices.searchDoctorApi(body: inputBody).then((value) {
      _searchModel = value!;
      Get.toNamed(
        Routes.findDoctorScreen,
        arguments: [Strings.findDoctor],
      );
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isSearchLoading.value = false;
    update();
    return _searchModel;
  }

//!find doctor
  Rx<List<Doctor>> foundDoctor = Rx<List<Doctor>>([]);

  @override
  void onClose() {}
  void filterDoctors(String? value) {
    List<Doctor> results = [];
    if (value!.isEmpty) {
      results = findDoctorListModel.data.doctors;
    } else {
      results = findDoctorListModel.data.doctors
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    }

    foundDoctor.value = results;
  }
}
