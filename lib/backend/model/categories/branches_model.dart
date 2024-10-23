
class BranchesModel {
  Message message;
  List<Datum> data;
  String type;

  BranchesModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory BranchesModel.fromJson(Map<String, dynamic> json) => BranchesModel(
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
  String name;
  String email;
  String web;
  String description;
  String slug;
  int status;
  int lastEditBy;
  DateTime createdAt;

  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.web,
    required this.description,
    required this.slug,
    required this.status,
    required this.lastEditBy,
    required this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        web: json["web"],
        description: json["description"],
        slug: json["slug"],
        status: json["status"],
        lastEditBy: json["last_edit_by"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "web": web,
        "description": description,
        "slug": slug,
        "status": status,
        "last_edit_by": lastEditBy,
        "created_at": createdAt.toIso8601String(),
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
