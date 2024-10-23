class SubmitAutomaticGatewayModel {
  Message message;
  Data data;
  String type;

  SubmitAutomaticGatewayModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory SubmitAutomaticGatewayModel.fromJson(Map<String, dynamic> json) =>
      SubmitAutomaticGatewayModel(
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
  String redirectUrl;

  Data({
    required this.redirectUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        redirectUrl: json["redirect_url"],
      );

  Map<String, dynamic> toJson() => {
        "redirect_url": redirectUrl,
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
