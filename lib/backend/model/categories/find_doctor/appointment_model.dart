
class AppointmentModel {
  Message message;
  Data data;
  String type;

  AppointmentModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
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
  String name;
  String phone;
  String email;
  String age;
  String type;
  String gender;
  String slug;
  dynamic userId;
  String siteType;
  String authenticated;
  int doctorId;
  String scheduleId;
  int patientNumber;
  Details details;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.name,
    required this.phone,
    required this.email,
    required this.age,
    required this.type,
    required this.gender,
    required this.slug,
    required this.userId,
    required this.siteType,
    required this.authenticated,
    required this.doctorId,
    required this.scheduleId,
    required this.patientNumber,
    required this.details,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        age: json["age"],
        type: json["type"],
        gender: json["gender"],
        slug: json["slug"],
        userId: json["user_id"],
        siteType: json["site_type"],
        authenticated: json["authenticated"],
        doctorId: json["doctor_id"],
        scheduleId: json["schedule_id"],
        patientNumber: json["patient_number"],
        details: Details.fromJson(json["details"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "email": email,
        "age": age,
        "type": type,
        "gender": gender,
        "slug": slug,
        "user_id": userId,
        "site_type": siteType,
        "authenticated": authenticated,
        "doctor_id": doctorId,
        "schedule_id": scheduleId,
        "patient_number": patientNumber,
        "details": details.toJson(),
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}

class Details {
  int doctorFees;
  int fixedCharge;
  double percentCharge;
  double totalCharge;
  double payableAmount;

  Details({
    required this.doctorFees,
    required this.fixedCharge,
    required this.percentCharge,
    required this.totalCharge,
    required this.payableAmount,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        doctorFees: json["doctor_fees"],
        fixedCharge: json["fixed_charge"],
        percentCharge: json["percent_charge"]?.toDouble(),
        totalCharge: json["total_charge"]?.toDouble(),
        payableAmount: json["payable_amount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "doctor_fees": doctorFees,
        "fixed_charge": fixedCharge,
        "percent_charge": percentCharge,
        "total_charge": totalCharge,
        "payable_amount": payableAmount,
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
