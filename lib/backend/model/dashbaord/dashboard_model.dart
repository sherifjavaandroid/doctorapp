import 'dart:convert';

import '../../../widgets/dropdown/custom_dropdown.dart';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  Message message;
  Data data;
  String type;

  DashboardModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
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
  List<Journal> journal;
  List<Testimonial> testimonial;
  List<Branch> branch;
  List<BranchHasDepartment> branchHasDepartment;
  List<DoctorList> doctorList;
  ImagePaths doctorImagePaths;
  List<WebLink> webLinks;
  ImagePaths imagePaths;

  Data({
    required this.journal,
    required this.testimonial,
    required this.branch,
    required this.branchHasDepartment,
    required this.doctorList,
    required this.doctorImagePaths,
    required this.webLinks,
    required this.imagePaths,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        journal:
            List<Journal>.from(json["journal"].map((x) => Journal.fromJson(x))),
        testimonial: List<Testimonial>.from(
            json["testimonial"].map((x) => Testimonial.fromJson(x))),
        branch:
            List<Branch>.from(json["branch"].map((x) => Branch.fromJson(x))),
        branchHasDepartment: List<BranchHasDepartment>.from(
            json["branch_has_department"]
                .map((x) => BranchHasDepartment.fromJson(x))),
        doctorList: List<DoctorList>.from(
            json["doctor_list"].map((x) => DoctorList.fromJson(x))),
        doctorImagePaths: ImagePaths.fromJson(json["doctor_image_paths"]),
        webLinks: List<WebLink>.from(
            json["web_links"].map((x) => WebLink.fromJson(x))),
        imagePaths: ImagePaths.fromJson(json["image_paths"]),
      );

  Map<String, dynamic> toJson() => {
        "journal": List<dynamic>.from(journal.map((x) => x.toJson())),
        "testimonial": List<dynamic>.from(testimonial.map((x) => x.toJson())),
        "branch": List<dynamic>.from(branch.map((x) => x.toJson())),
        "branch_has_department":
            List<dynamic>.from(branchHasDepartment.map((x) => x.toJson())),
        "doctor_list": List<dynamic>.from(doctorList.map((x) => x.toJson())),
        "doctor_image_paths": doctorImagePaths.toJson(),
        "web_links": List<dynamic>.from(webLinks.map((x) => x.toJson())),
        "image_paths": imagePaths.toJson(),
      };
}

class Branch implements DropdownModel {
  int id;
  String name;
  String slug;
  int status;
  int lastEditBy;
  DateTime createdAt;

  Branch({
    required this.id,
    required this.name,
    required this.slug,
    required this.status,
    required this.lastEditBy,
    required this.createdAt,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        status: json["status"],
        lastEditBy: json["last_edit_by"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "status": status,
        "last_edit_by": lastEditBy,
        "created_at": createdAt.toIso8601String(),
      };
      
        @override
       
        String get code => "";
      
        @override
       
        String get img => "";
      
        @override
        String get title => name;
}

class BranchHasDepartment {
  int id;
  int hospitalBranchId;
  int hospitalDepartmentId;
  String hospitalDepartmentName;
  String hospitalDepartmentSlug;
  // int hospitalDepartmentStatus;
  DateTime createdAt;

  BranchHasDepartment({
    required this.id,
    required this.hospitalBranchId,
    required this.hospitalDepartmentId,
    required this.hospitalDepartmentName,
    required this.hospitalDepartmentSlug,
    // required this.hospitalDepartmentStatus,
    required this.createdAt,
  });

  factory BranchHasDepartment.fromJson(Map<String, dynamic> json) =>
      BranchHasDepartment(
        id: json["id"],
        hospitalBranchId: json["hospital_branch_id"],
        hospitalDepartmentId: json["hospital_department_id"],
        hospitalDepartmentName: json["hospital_department_name"],
        hospitalDepartmentSlug: json["hospital_department_slug"],
        // hospitalDepartmentStatus: json["hospital_department_status"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospital_branch_id": hospitalBranchId,
        "hospital_department_id": hospitalDepartmentId,
        "hospital_department_name": hospitalDepartmentName,
        "hospital_department_slug": hospitalDepartmentSlug,
        // "hospital_department_status": hospitalDepartmentStatus,
        "created_at": createdAt.toIso8601String(),
      };
}

class ImagePaths {
  String baseUrl;
  String pathLocation;
  String defaultImage;

  ImagePaths({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ImagePaths.fromJson(Map<String, dynamic> json) => ImagePaths(
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

class DoctorList {
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

  DoctorList({
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
     this.image,
    required this.status,
    required this.createdAt,
  });

  factory DoctorList.fromJson(Map<String, dynamic> json) => DoctorList(
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

class Journal {
  int id;
  String slug;
  String title;
  String image;
  String description;
  List<String> tags;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  Journal({
    required this.id,
    required this.slug,
    required this.title,
    required this.image,
    required this.description,
    required this.tags,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        image: json["image"],
        description: json["description"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "image": image,
        "description": description,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Testimonial {
  String id;
  String name;
  String designation;
  String image;
  DateTime createdAt;
  String comment;

  Testimonial({
    required this.id,
    required this.name,
    required this.designation,
    required this.image,
    required this.createdAt,
    required this.comment,
  });

  factory Testimonial.fromJson(Map<String, dynamic> json) => Testimonial(
        id: json["id"],
        name: json["name"],
        designation: json["designation"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "designation": designation,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "comment": comment,
      };
}

class WebLink {
  String name;
  String link;

  WebLink({
    required this.name,
    required this.link,
  });

  factory WebLink.fromJson(Map<String, dynamic> json) => WebLink(
        name: json["name"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
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
