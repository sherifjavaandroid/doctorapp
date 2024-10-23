
class DoctorInfoModel {
  Message message;
  Data data;
  String type;

  DoctorInfoModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory DoctorInfoModel.fromJson(Map<String, dynamic> json) =>
      DoctorInfoModel(
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
  Info info;
  List<Schedule> schedule;
  ImageAsset imageAsset;

  Data({
    required this.info,
    required this.schedule,
    required this.imageAsset,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        info: Info.fromJson(json["info"]),
        schedule: List<Schedule>.from(
            json["schedule"].map((x) => Schedule.fromJson(x))),
        imageAsset: ImageAsset.fromJson(json["image_asset"]),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
        "image_asset": imageAsset.toJson(),
      };
}

class ImageAsset {
  String baseUrl;
  String pathLocation;
  String defaultImage;

  ImageAsset({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ImageAsset.fromJson(Map<String, dynamic> json) => ImageAsset(
        baseUrl: json["base_url"],
        pathLocation: json["path_location"],
        defaultImage: json["default_image"],
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "path_location": pathLocation,
        "default_image": defaultImage,
      };
}

class Info {
  String name;
  dynamic doctorTitle;
  String image;
  String qualification;
  String speciality;
  String language;
  String designation;
  String department;
  String contact;
  String offDays;
  String floorNumber;
  String roomNumber;
  String branch;
  String address;
  int fees;
  String currencyCode;

  Info({
    required this.name,
    required this.doctorTitle,
    required this.image,
    required this.qualification,
    required this.speciality,
    required this.language,
    required this.designation,
    required this.department,
    required this.contact,
    required this.offDays,
    required this.floorNumber,
    required this.roomNumber,
    required this.branch,
    required this.address,
    required this.fees,
    required this.currencyCode,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        name: json["name"],
        doctorTitle: json["doctor_title"]??"",
        image: json["image"],
        qualification: json["qualification"],
        speciality: json["speciality"],
        language: json["language"],
        designation: json["designation"],
        department: json["department"],
        contact: json["contact"],
        offDays: json["off_days"],
        floorNumber: json["floor_number"],
        roomNumber: json["room_number"],
        branch: json["branch"],
        address: json["address"],
        fees: json["fees"]??"",
        currencyCode: json["currency_code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "doctor_title": doctorTitle,
        "image": image,
        "qualification": qualification,
        "speciality": speciality,
        "language": language,
        "designation": designation,
        "department": department,
        "contact": contact,
        "off_days": offDays,
        "floor_number": floorNumber,
        "room_number": roomNumber,
        "branch": branch,
        "address": address,
        "fees": fees,
        "currency_code": currencyCode,
      };
}

class Schedule {
  int id;
  String day;
  String fromTime;
  String toTime;
  String date;
  String month;
  String year;

  Schedule({
    required this.id,
    required this.day,
    required this.fromTime,
    required this.toTime,
    required this.date,
    required this.month,
    required this.year,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        day: json["day"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day": day,
        "from_time": fromTime,
        "to_time": toTime,
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
