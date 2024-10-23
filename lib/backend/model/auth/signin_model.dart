
class SignInModel {
  Message? message;
  Data? data;
  String? type;

  SignInModel({
    this.message,
    this.data,
    this.type,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        message:
            json["message"] == null ? null : Message.fromJson(json["message"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message?.toJson(),
        "data": data?.toJson(),
        "type": type,
      };
}

class Data {
  String? token;
  String? imagePath;
  String? defaultImage;
  User? user;

  Data({
    this.token,
    this.imagePath,
    this.defaultImage,
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        imagePath: json["image_path"],
        defaultImage: json["default_image"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "image_path": imagePath,
        "default_image": defaultImage,
        "user": user?.toJson(),
      };
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  int? status;
  String? email;
  dynamic image;
  int? emailVerified;
  int? smsVerified;
  int? kycVerified;
  // DateTime? createdAt;
  // DateTime? updatedAt;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.status,
    this.email,
    this.image,
    this.emailVerified,
    this.smsVerified,
    this.kycVerified,
    // this.createdAt,
    // this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"] ?? " ",
        status: json["status"],
        email: json["email"],
        image: json["image"],
        emailVerified: json["email_verified"],
        smsVerified: json["sms_verified"],
        kycVerified: json["kyc_verified"],
        // createdAt: json["created_at"] == null
        //     ? null
        //     : DateTime.parse(json["created_at"]),
        // updatedAt: json["updated_at"] == null
        //     ? null
        //     : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username,
        "status": status,
        "email": email,
        "image": image,
        "email_verified": emailVerified,
        "sms_verified": smsVerified,
        "kyc_verified": kycVerified,
        // "created_at": createdAt?.toIso8601String(),
        // "updated_at": updatedAt?.toIso8601String(),
      };
}

class Message {
  List<String>? success;

  Message({
    this.success,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        success: json["success"] == null
            ? []
            : List<String>.from(json["success"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success":
            success == null ? [] : List<dynamic>.from(success!.map((x) => x)),
      };
}
