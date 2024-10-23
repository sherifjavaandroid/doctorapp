
class PaymentGatewayModel {
  Message message;
  Data data;
  String type;

  PaymentGatewayModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory PaymentGatewayModel.fromJson(Map<String, dynamic> json) =>
      PaymentGatewayModel(
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
  List<PaymentGateway> paymentGateway;
  ImagePath imagePath;

  Data({
    required this.paymentGateway,
    required this.imagePath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paymentGateway: List<PaymentGateway>.from(
            json["payment_gateway"].map((x) => PaymentGateway.fromJson(x))),
        imagePath: ImagePath.fromJson(json["image_path"]),
      );

  Map<String, dynamic> toJson() => {
        "payment_gateway":
            List<dynamic>.from(paymentGateway.map((x) => x.toJson())),
        "image_path": imagePath.toJson(),
      };
}

class ImagePath {
  String baseUrl;
  String pathLocation;
  String defaultImage;

  ImagePath({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ImagePath.fromJson(Map<String, dynamic> json) => ImagePath(
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

class PaymentGateway {
  int id;
  int paymentGatewayId;
  String name;
  String alias;
  String currencyCode;
  String? currencySymbol;
  String image;
  String minLimit;
  String maxLimit;
  String percentCharge;
  String fixedCharge;
  String rate;
  DateTime createdAt;
  DateTime updatedAt;

  PaymentGateway({
    required this.id,
    required this.paymentGatewayId,
    required this.name,
    required this.alias,
    required this.currencyCode,
    required this.currencySymbol,
    required this.image,
    required this.minLimit,
    required this.maxLimit,
    required this.percentCharge,
    required this.fixedCharge,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentGateway.fromJson(Map<String, dynamic> json) => PaymentGateway(
        id: json["id"],
        paymentGatewayId: json["payment_gateway_id"],
        name: json["name"],
        alias: json["alias"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        image: json["image"],
        minLimit: json["min_limit"],
        maxLimit: json["max_limit"],
        percentCharge: json["percent_charge"],
        fixedCharge: json["fixed_charge"],
        rate: json["rate"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_gateway_id": paymentGatewayId,
        "name": name,
        "alias": alias,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "image": image,
        "min_limit": minLimit,
        "max_limit": maxLimit,
        "percent_charge": percentCharge,
        "fixed_charge": fixedCharge,
        "rate": rate,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
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
