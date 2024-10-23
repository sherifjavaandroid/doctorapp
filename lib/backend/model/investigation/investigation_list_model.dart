
class InvestigationListModel {
  Message message;
  Data data;
  String type;

  InvestigationListModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory InvestigationListModel.fromJson(Map<String, dynamic> json) =>
      InvestigationListModel(
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
  List<Investigation> isvestigation;

  Data({
    required this.isvestigation,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isvestigation: List<Investigation>.from(
            json["isvestigation"].map((x) => Investigation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isvestigation":
            List<dynamic>.from(isvestigation.map((x) => x.toJson())),
      };
}

class Investigation {
  int id;
  String name;
  String slug;
  String price;
  String offerPrice;
  int status;
  int homeService;
  int lastEditBy;
  DateTime createdAt;

  Investigation({
    required this.id,
    required this.name,
    required this.slug,
    required this.price,
    required this.offerPrice,
    required this.status,
    required this.homeService,
    required this.lastEditBy,
    required this.createdAt,
  });

  factory Investigation.fromJson(Map<String, dynamic> json) => Investigation(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        price: json["price"],
        offerPrice: json["offer_price"],
        status: json["status"],
        homeService: json["home_service"],
        lastEditBy: json["last_edit_by"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "price": price,
        "offer_price": offerPrice,
        "status": status,
        "home_service": homeService,
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
