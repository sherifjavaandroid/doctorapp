class HistoryModel {
  Message message;
  Data data;
  String type;

  HistoryModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        message: Message.fromJson(json["message"]),
        data: Data.fromJson(json["data"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
        "type": type,
      };
}

class Data {
  List<Booking> booking;
  PrescriptionPaths prescriptionPaths;

  Data({
    required this.booking,
    required this.prescriptionPaths,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        booking:
            List<Booking>.from(json["booking"].map((x) => Booking.fromJson(x))),
        prescriptionPaths:
            PrescriptionPaths.fromJson(json["prescription_paths"]),
      );

  Map<String, dynamic> toJson() => {
        "booking": List<dynamic>.from(booking.map((x) => x.toJson())),
        "prescription_paths": prescriptionPaths.toJson(),
      };
}

class Booking {
  int id;
  String doctorName;
  String patientName;
  String? patientMobile;
  String patientEmail;
  String type;
  String fees;
  String day;
  String fromTime;
  String toTime;
  Details? details;
  dynamic prescription;
  int status;
  String date;
  String month;
  String year;

  Booking({
    required this.id,
    required this.doctorName,
    required this.patientName,
    required this.patientMobile,
    required this.patientEmail,
    required this.type,
    required this.fees,
    required this.day,
    required this.fromTime,
    required this.toTime,
    required this.details,
    required this.prescription,
    required this.status,
    required this.date,
    required this.month,
    required this.year,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        doctorName: json["doctor_name"],
        patientName: json["patient_name"],
        patientMobile: json["patient_mobile"]??"",
        patientEmail: json["patient_email"],
        type: json["type"],
        fees: json["fees"],
        day: json["day"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        details:
            json["details"] != null ? Details.fromJson(json["details"]) : null,
        prescription: json["prescription"],
        status: json["status"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_name": doctorName,
        "patient_name": patientName,
        "patient_mobile": patientMobile,
        "patient_email": patientEmail,
        "type": type,
        "fees": fees,
        "day": day,
        "from_time": fromTime,
        "to_time": toTime,
        "details": details!.toJson(),
        "prescription": prescription,
        "status": status,
        "date": date,
        "month": month,
        "year": year,
      };
}

class Details {
  int doctorFees;
  int fixedCharge;
  double percentCharge;
  double totalCharge;
  double payableAmount;
  double? gatewayPayable;
  String paymentMethod;
  GatewayCurrency? gatewayCurrency;
  String currency;

  Details({
    required this.doctorFees,
    required this.fixedCharge,
    required this.percentCharge,
    required this.totalCharge,
    required this.payableAmount,
    this.gatewayPayable,
    required this.paymentMethod,
    required this.gatewayCurrency,
    required this.currency,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        doctorFees: json["doctor_fees"],
        fixedCharge: json["fixed_charge"],
        percentCharge: json["percent_charge"]?.toDouble(),
        totalCharge: json["total_charge"]?.toDouble(),
        payableAmount: json["payable_amount"]?.toDouble(),
        gatewayPayable: json["gateway_payable"]?.toDouble(),
        paymentMethod: json["payment_method"],
        gatewayCurrency: json["gateway_currency"] != null
            ? GatewayCurrency.fromJson(json["gateway_currency"])
            : null,
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "doctor_fees": doctorFees,
        "fixed_charge": fixedCharge,
        "percent_charge": percentCharge,
        "total_charge": totalCharge,
        "payable_amount": payableAmount,
        "gateway_payable": gatewayPayable,
        "payment_method": paymentMethod,
        "gateway_currency": gatewayCurrency!.toJson(),
        "currency": currency,
      };
}

class GatewayCurrency {
  int id;
  String alias;
  String code;
  String rate;

  GatewayCurrency({
    required this.id,
    required this.alias,
    required this.code,
    required this.rate,
  });

  factory GatewayCurrency.fromJson(Map<String, dynamic> json) =>
      GatewayCurrency(
        id: json["id"],
        alias: json["alias"],
        code: json["code"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alias": alias,
        "code": code,
        "rate": rate,
      };
}

class PrescriptionPaths {
  String baseUrl;
  String pathLocation;
  String defaultPath;

  PrescriptionPaths({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultPath,
  });

  factory PrescriptionPaths.fromJson(Map<String, dynamic> json) =>
      PrescriptionPaths(
        baseUrl: json["base_url"],
        pathLocation: json["path_location"],
        defaultPath: json["default_path"],
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "path_location": pathLocation,
        "default_path": defaultPath,
      };
}

class Message {
  List<String> success;

  Message({
    required this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: List<String>.from(json["success"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(success.map((x) => x)),
      };
}
