import '../../backend/model/categories/branches_model.dart';
import '../../backend/services/api_services.dart';
import '../../utils/basic_screen_imports.dart';

class BranchController extends GetxController {
  final searchBarController = TextEditingController();

  @override
  void onInit() {
    getBranchesList();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  late BranchesModel _branchesModel;

  BranchesModel get branchesModel => _branchesModel;

  Future<BranchesModel> getBranchesList() async {
    _isLoading.value = true;
    update();

    await ApiServices.branchesApi().then((value) {
      _branchesModel = value!;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });

    _isLoading.value = false;
    update();
    return _branchesModel;
  }

  Rx<List<Datum>> foundBranches = Rx<List<Datum>>([]);

  void filterHealthPackage(String? value) {
    List<Datum> results = [];
    if (value!.isEmpty) {
      results = branchesModel.data;
    } else {
      results = branchesModel.data
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    }

    foundBranches.value = results;
  }
}
