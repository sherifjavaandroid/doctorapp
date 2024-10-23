
import '../../backend/model/categories/find_doctor/doctor_info_model.dart';
import '../../backend/services/api_services.dart';
import '../../utils/basic_screen_imports.dart';
import 'find_doctor_controller.dart';

class DoctorProfileController extends GetxController {

  final controller = Get.put(FindDoctorController());
  @override
  void onInit() {
    getDoctorInfo();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  late DoctorInfoModel _doctorInfoModel;

  DoctorInfoModel get doctorInfoModel => _doctorInfoModel;

  Future<DoctorInfoModel> getDoctorInfo() async {
    _isLoading.value = true;
    update();
    await ApiServices.doctorInfoApi(controller.slug.value).then((value){
      _doctorInfoModel = value!;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return _doctorInfoModel;
  }
}
