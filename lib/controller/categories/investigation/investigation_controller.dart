import '../../../backend/model/investigation/investigation_list_model.dart';
import '../../../backend/services/api_services.dart';
import '../../../utils/basic_screen_imports.dart';

class InvestigationController extends GetxController {
  final searchBarController = TextEditingController();

  @override
  void onInit() {
    getInvestigationList();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  late InvestigationListModel _investigationListModel;

  InvestigationListModel get investigationListModel => _investigationListModel;

  Future<InvestigationListModel> getInvestigationList() async {
    _isLoading.value = true;
    update();

    await ApiServices.investigationApi().then((value) {
      _investigationListModel = value!;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });

    _isLoading.value = false;
    update();
    return _investigationListModel;
  }

  Rx<List<Investigation>> foundInvestigation = Rx<List<Investigation>>([]);

  @override
  void onClose() {}
  void filterInvestigation(String? value) {
    List<Investigation> results = [];
    if (value!.isEmpty) {
      results = investigationListModel.data.isvestigation;
    } else {
      results = investigationListModel.data.isvestigation
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    }

    foundInvestigation.value = results;
  }
}
