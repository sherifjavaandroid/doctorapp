
class FindDoctorListModel {
  Message message;
  Data data;
  String type;

  FindDoctorListModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory FindDoctorListModel.fromJson(Map<String, dynamic> json) =>
      FindDoctorListModel(
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
  List<Doctor> doctors;
  ImageAsset imageAsset;

  Data({
    required this.doctors,
    required this.imageAsset,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        doctors:
            List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
        imageAsset: ImageAsset.fromJson(json["image_asset"]),
      );

  Map<String, dynamic> toJson() => {
        "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
        "image_asset": imageAsset.toJson(),
      };
}

class Doctor {
  int id;
  String hospitalBranch;
  String hospitalDepartment;
  String name;
  String slug;
  dynamic doctorTitle;
  String qualification;
  String speciality;
  String language;
  String designation;
  String contact;
  String floorNumber;
  String roomNumber;
  String address;
  String fees;
  String offDays;
  dynamic image;
  int status;
  DateTime createdAt;

  Doctor({
    required this.id,
    required this.hospitalBranch,
    required this.hospitalDepartment,
    required this.name,
    required this.slug,
     this.doctorTitle,
    required this.qualification,
    required this.speciality,
    required this.language,
    required this.designation,
    required this.contact,
    required this.floorNumber,
    required this.roomNumber,
    required this.address,
    required this.fees,
    required this.offDays,
    required this.image,
    required this.status,
    required this.createdAt,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        hospitalBranch: json["hospital_branch"],
        hospitalDepartment: json["hospital_department"],
        name: json["name"],
        slug: json["slug"],
        doctorTitle: json["doctor_title"]??"",
        qualification: json["qualification"],
        speciality: json["speciality"],
        language: json["language"],
        designation: json["designation"],
        contact: json["contact"],
        floorNumber: json["floor_number"],
        roomNumber: json["room_number"],
        address: json["address"],
        fees: json["fees"],
        offDays: json["off_days"],
        image: json["image"]??"",
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospital_branch": hospitalBranch,
        "hospital_department": hospitalDepartment,
        "name": name,
        "slug": slug,
        "doctor_title": doctorTitle,
        "qualification": qualification,
        "speciality": speciality,
        "language": language,
        "designation": designation,
        "contact": contact,
        "floor_number": floorNumber,
        "room_number": roomNumber,
        "address": address,
        "fees": fees,
        "off_days": offDays,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
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
