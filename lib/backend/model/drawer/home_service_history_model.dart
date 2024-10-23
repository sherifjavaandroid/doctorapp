
class ServiceHistoryModel {
  Message message;
  List<Datum> data;
  String type;

  ServiceHistoryModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory ServiceHistoryModel.fromJson(Map<String, dynamic> json) =>
      ServiceHistoryModel(
        message: Message.fromJson(json["message"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "type": type,
      };
}

class Datum {
  int id;
  String slug;
  String patientName;
  String patientEmail;
  dynamic patientMobile;
  List<String> type;
  String schedule;
  int status;
  String date;
  String month;
  String year;

  Datum({
    required this.id,
    required this.slug,
    required this.patientName,
    required this.patientEmail,
     this.patientMobile,
    required this.type,
    required this.schedule,
    required this.status,
    required this.date,
    required this.month,
    required this.year,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        slug: json["slug"],
        patientName: json["patient_name"],
        patientEmail: json["patient_email"],
        patientMobile: json["patient_mobile"]??"",
        type: List<String>.from(json["type"].map((x) => x)),
        schedule: json["schedule"],
        status: json["status"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "patient_name": patientName,
        "patient_email": patientEmail,
        "patient_mobile": patientMobile,
        "type": List<dynamic>.from(type.map((x) => x)),
        "schedule": schedule,
        "status": status,
        "date": date,
        "month": month,
        "year": year,
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
