import '../../backend/model/categories/health_package_model.dart';
import '../../backend/services/api_services.dart';
import '../../utils/basic_screen_imports.dart';

class HealthController extends GetxController {
  final searchBarController = TextEditingController();

  @override
  void onInit() {
    getHealthPackageList();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  late HealthPackageModel _healthPackageModel;

  HealthPackageModel get healthPackageModel => _healthPackageModel;

  Future<HealthPackageModel> getHealthPackageList() async {
    _isLoading.value = true;
    update();

    await ApiServices.healthPackageApi().then((value) {
      _healthPackageModel = value!;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });

    _isLoading.value = false;
    update();
    return _healthPackageModel;
  }

  Rx<List<HealthPackage>> foundHealthPackage = Rx<List<HealthPackage>>([]);

  @override
  void onClose() {}

  void filterHealthPackage(String? value) {
    List<HealthPackage> results = [];

    if (value!.isEmpty) {
      results = healthPackageModel.data.healthPackage;
    } else {
      results = healthPackageModel.data.healthPackage
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    }

    // Check if there are any matching results
    if (results.isNotEmpty) {
      foundHealthPackage.value = results;
    } else {
      // Set the value to null to indicate no data found
      foundHealthPackage.value = [];
    }
  }
}
