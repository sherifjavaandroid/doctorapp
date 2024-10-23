
class BasicSettingModel {
  final Message? message;
  final Data? data;
  final String? type;

  BasicSettingModel({
    this.message,
    this.data,
    this.type,
  });

  factory BasicSettingModel.fromJson(Map<String, dynamic> json) =>
      BasicSettingModel(
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
  final List<BasicSetting>? basicSettings;
  final List<SplashScreen>? splashScreen;
  final List<OnboardScreen>? onboardScreen;
  final List<WebLink>? webLinks;
  final AppImagePath? basicSeetingsImagePaths;
  final AppImagePath? appImagePath;

  Data({
    this.basicSettings,
    this.splashScreen,
    this.onboardScreen,
    this.webLinks,
    this.basicSeetingsImagePaths,
    this.appImagePath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        basicSettings: json["basic_settings"] == null
            ? []
            : List<BasicSetting>.from(
                json["basic_settings"]!.map((x) => BasicSetting.fromJson(x))),
        splashScreen: json["splash_screen"] == null
            ? []
            : List<SplashScreen>.from(
                json["splash_screen"]!.map((x) => SplashScreen.fromJson(x))),
        onboardScreen: json["onboard_screen"] == null
            ? []
            : List<OnboardScreen>.from(
                json["onboard_screen"]!.map((x) => OnboardScreen.fromJson(x))),
        webLinks: json["web_links"] == null
            ? []
            : List<WebLink>.from(
                json["web_links"]!.map((x) => WebLink.fromJson(x))),
        basicSeetingsImagePaths: json["basic_seetings_image_paths"] == null
            ? null
            : AppImagePath.fromJson(json["basic_seetings_image_paths"]),
        appImagePath: json["app_image_path"] == null
            ? null
            : AppImagePath.fromJson(json["app_image_path"]),
      );

  Map<String, dynamic> toJson() => {
        "basic_settings": basicSettings == null
            ? []
            : List<dynamic>.from(basicSettings!.map((x) => x.toJson())),
        "splash_screen": splashScreen == null
            ? []
            : List<dynamic>.from(splashScreen!.map((x) => x.toJson())),
        "onboard_screen": onboardScreen == null
            ? []
            : List<dynamic>.from(onboardScreen!.map((x) => x.toJson())),
        "web_links": webLinks == null
            ? []
            : List<dynamic>.from(webLinks!.map((x) => x.toJson())),
        "basic_seetings_image_paths": basicSeetingsImagePaths?.toJson(),
        "app_image_path": appImagePath?.toJson(),
      };
}

class AppImagePath {
  final String? baseUrl;
  final String? pathLocation;
  final String? defaultImage;

  AppImagePath({
    this.baseUrl,
    this.pathLocation,
    this.defaultImage,
  });

  factory AppImagePath.fromJson(Map<String, dynamic> json) => AppImagePath(
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

class BasicSetting {
  final int? id;
  final String? siteName;
  final String? baseColor;
  final String? siteLogoDark;
  final String? siteLogo;
  final String? siteFavDark;
  final String? siteFav;
  final DateTime? createdAt;

  BasicSetting({
    this.id,
    this.siteName,
    this.baseColor,
    this.siteLogoDark,
    this.siteLogo,
    this.siteFavDark,
    this.siteFav,
    this.createdAt,
  });

  factory BasicSetting.fromJson(Map<String, dynamic> json) => BasicSetting(
        id: json["id"],
        siteName: json["site_name"],
        baseColor: json["base_color"],
        siteLogoDark: json["site_logo_dark"],
        siteLogo: json["site_logo"],
        siteFavDark: json["site_fav_dark"],
        siteFav: json["site_fav"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "site_name": siteName,
        "base_color": baseColor,
        "site_logo_dark": siteLogoDark,
        "site_logo": siteLogo,
        "site_fav_dark": siteFavDark,
        "site_fav": siteFav,
        "created_at": createdAt?.toIso8601String(),
      };
}

class OnboardScreen {
  final int? id;
  final String? title;
  final String? subTitle;
  final String? image;
  final int? status;
  final int? lastEditBy;
  final DateTime? createdAt;

  OnboardScreen({
    this.id,
    this.title,
    this.subTitle,
    this.image,
    this.status,
    this.lastEditBy,
    this.createdAt,
  });

  factory OnboardScreen.fromJson(Map<String, dynamic> json) => OnboardScreen(
        id: json["id"],
        title: json["title"],
        subTitle: json["sub_title"],
        image: json["image"],
        status: json["status"],
        lastEditBy: json["last_edit_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "sub_title": subTitle,
        "image": image,
        "status": status,
        "last_edit_by": lastEditBy,
        "created_at": createdAt?.toIso8601String(),
      };
}

class SplashScreen {
  final int? id;
  final String? version;
  final String? splashScreenImage;
  final DateTime? createdAt;

  SplashScreen({
    this.id,
    this.version,
    this.splashScreenImage,
    this.createdAt,
  });

  factory SplashScreen.fromJson(Map<String, dynamic> json) => SplashScreen(
        id: json["id"],
        version: json["version"],
        splashScreenImage: json["splash_screen_image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "splash_screen_image": splashScreenImage,
        "created_at": createdAt?.toIso8601String(),
      };
}

class WebLink {
  final String? name;
  final String? link;

  WebLink({
    this.name,
    this.link,
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
  final List<String>? success;

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
