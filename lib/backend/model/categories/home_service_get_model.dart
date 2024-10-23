
class HomeServiceGetModel {
  Message message;
  Data data;
  String type;

  HomeServiceGetModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory HomeServiceGetModel.fromJson(Map<String, dynamic> json) =>
      HomeServiceGetModel(
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
  List<Schedule> schedules;
  List<Type> types;

  Data({
    required this.schedules,
    required this.types,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        schedules: List<Schedule>.from(
            json["schedules"].map((x) => Schedule.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "schedules": List<dynamic>.from(schedules.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
      };
}

class Schedule {
  String day;
  String date;
  String month;
  String year;

  Schedule({
    required this.day,
    required this.date,
    required this.month,
    required this.year,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        day: json["day"],
        date: json["date"],
        month: json["Month"],
        year: json["Year"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "date": date,
        "Month": month,
        "Year": year,
      };
}

class Type {
  int id;
  String name;
  String slug;
  String price;
  String offerPrice;
  int status;
  int lastEditBy;
  DateTime createdAt;

  Type({
    required this.id,
    required this.name,
    required this.slug,
    required this.price,
    required this.offerPrice,
    required this.status,
    required this.lastEditBy,
    required this.createdAt,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
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
