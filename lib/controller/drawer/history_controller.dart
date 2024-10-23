// ignore_for_file: depend_on_referenced_packages
import 'package:permission_handler/permission_handler.dart';
import '../../backend/backend_utils/custom_snackbar.dart';
import '../../backend/model/drawer/history_model.dart';
import '../../backend/services/api_services.dart';
import '../../utils/basic_screen_imports.dart';
import 'dart:io';
import 'package:adoctor/utils/basic_widget_imports.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class HistoryController extends GetxController {
  @override
  void onInit() {
    getHistory();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  late HistoryModel _historyModel;

  HistoryModel get historyModel => _historyModel;

  Future<HistoryModel> getHistory() async {
    _isLoading.value = true;
    update();

    await ApiServices.historyApi().then((value) {
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

  final _isDownloadLoading = false.obs;
  bool get isDownloadLoading => _isDownloadLoading.value;
  Future<void> downloadPDF(
      {required String url, required String pdfFileName}) async {
    _isDownloadLoading.value = true;
    // Check and request storage permission
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        // Permission denied by user
        CustomSnackBar.error('Permission denied. Unable to download the file.');
        return;
      }
    }
    final http.Response response = await http.get(Uri.parse(url));
    final String fileName = '${DateTime.now().millisecondsSinceEpoch}.pdf';
    // kept the file name in the global variable pdfFilename
    pdfFileName = fileName;
    if (response.statusCode == 200) {
      Directory? downloadsDirectory;
      if (Platform.isIOS) {
        _isDownloadLoading.value = false;
        downloadsDirectory = await getDownloadsDirectory();
      } else if (Platform.isAndroid) {
        _isDownloadLoading.value = false;
        String directory = "/storage/emulated/0/";
        final bool dirDownloadExists =
            await Directory("$directory/Download").exists();
        directory += dirDownloadExists ? "Download/" : "Downloads/";
        downloadsDirectory = Directory(directory);
      } else {
        // Handle other platforms here, if applicable
        CustomSnackBar.error('Unsupported platform for file download.');
        _isDownloadLoading.value = false;

        return;
      }

      final File file = File('${downloadsDirectory!.path}/$pdfFileName');
      await file.writeAsBytes(response.bodyBytes);
      CustomSnackBar.success('File downloaded successfully at ${file.path}!');
      _isDownloadLoading.value = false;
    } else {
      _isDownloadLoading.value = false;
      CustomSnackBar.error('Failed to download the file.');
    }
  }
}
