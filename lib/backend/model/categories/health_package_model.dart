
class HealthPackageModel {
  Message message;
  Data data;
  String type;

  HealthPackageModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory HealthPackageModel.fromJson(Map<String, dynamic> json) =>
      HealthPackageModel(
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
  List<HealthPackage> healthPackage;

  Data({
    required this.healthPackage,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        healthPackage: List<HealthPackage>.from(
            json["health_package"].map((x) => HealthPackage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "health_package":
            List<dynamic>.from(healthPackage.map((x) => x.toJson())),
      };
}

class HealthPackage {
  int id;
  String name;
  String slug;
  String title;
  String price;
  String? offerPrice;
  int status;
  int lastEditBy;
  DateTime createdAt;

  HealthPackage({
    required this.id,
    required this.name,
    required this.slug,
    required this.title,
    required this.price,
    this.offerPrice,
    required this.status,
    required this.lastEditBy,
    required this.createdAt,
  });

  factory HealthPackage.fromJson(Map<String, dynamic> json) => HealthPackage(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        title: json["title"],
        price: json["price"],
        offerPrice: json["offer_price"],
        status: json["status"],
        lastEditBy: json["last_edit_by"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "title": title,
        "price": price,
        "offer_price": offerPrice,
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
