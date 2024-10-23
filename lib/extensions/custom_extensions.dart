import 'dart:ui';

import 'package:get_storage/get_storage.dart';

import '../backend/services/api_endpoint.dart';

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

extension EndPointExtensions on String {
  String addBaseURl() {
    return "${ApiEndpoint.baseUrl}$this?language=${GetStorage().read('selectedLanguage')}";
  }

  double parseDouble() {
    return double.parse(this);
  }
}

extension EndExtensions on String {
  String addDBaseURl() {
    return "${ApiEndpoint.baseUrl}$this";
  }

  double parseDouble() {
    return double.parse(this);
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
