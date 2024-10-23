import '../../backend/model/drawer/home_service_history_model.dart';
import '../../backend/services/api_services.dart';
import '../../utils/basic_screen_imports.dart';

class HomeHistoryController extends GetxController {
  @override
  void onInit() {
    getHistory();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  late ServiceHistoryModel _historyModel;

  ServiceHistoryModel get homeHistoryModel => _historyModel;

  Future<ServiceHistoryModel> getHistory() async {
    _isLoading.value = true;
    update();

    await ApiServices.serviceHistoryApi().then((value) {
      _historyModel = value!;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });

    _isLoading.value = false;
    update();
    return _historyModel;
  }
}
