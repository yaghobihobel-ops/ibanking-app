import 'dart:convert';

import '../../../base/widgets/country_drop_down.dart';

BasicSettingsModel basicSettingsModelFromJson(String str) =>
    BasicSettingsModel.fromJson(json.decode(str));

String basicSettingsModelToJson(BasicSettingsModel data) =>
    json.encode(data.toJson());

class BasicSettingsModel {
  Message message;
  Data data;
  String type;

  BasicSettingsModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory BasicSettingsModel.fromJson(Map<String, dynamic> json) =>
      BasicSettingsModel(
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
  BasicSettings basicSettings;
  BaseCur baseCur;
  WebLinks webLinks;
  List<Country> countries;
  SplashScreen splashScreen;
  List<OnboardScreen> onboardScreens;
  ImagePaths imagePaths;
  AppImagePaths appImagePaths;

  Data({
    required this.basicSettings,
    required this.baseCur,
    required this.webLinks,
    required this.countries,
    required this.splashScreen,
    required this.onboardScreens,
    required this.imagePaths,
    required this.appImagePaths,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        basicSettings: BasicSettings.fromJson(json["basic_settings"]),
        baseCur: BaseCur.fromJson(json["base_cur"]),
        webLinks: WebLinks.fromJson(json["web_links"]),
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
        splashScreen: SplashScreen.fromJson(json["splash_screen"]),
        onboardScreens: List<OnboardScreen>.from(
            json["onboard_screens"].map((x) => OnboardScreen.fromJson(x))),
        imagePaths: ImagePaths.fromJson(json["image_paths"]),
        appImagePaths: AppImagePaths.fromJson(json["app_image_paths"]),
      );

  Map<String, dynamic> toJson() => {
        "basic_settings": basicSettings.toJson(),
        "base_cur": baseCur.toJson(),
        "web_links": webLinks.toJson(),
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "splash_screen": splashScreen.toJson(),
        "onboard_screens":
            List<dynamic>.from(onboardScreens.map((x) => x.toJson())),
        "image_paths": imagePaths.toJson(),
        "app_image_paths": appImagePaths.toJson(),
      };
}

class AppImagePaths {
  String baseUrl;
  String pathLocation;
  String defaultImage;

  AppImagePaths({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory AppImagePaths.fromJson(Map<String, dynamic> json) => AppImagePaths(
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

class BaseCur {
  int id;
  String code;
  String symbol;
  String rate;
  bool both;
  bool senderCurrency;
  bool receiverCurrency;

  BaseCur({
    required this.id,
    required this.code,
    required this.symbol,
    required this.rate,
    required this.both,
    required this.senderCurrency,
    required this.receiverCurrency,
  });

  factory BaseCur.fromJson(Map<String, dynamic> json) => BaseCur(
        id: json["id"],
        code: json["code"],
        symbol: json["symbol"],
        rate: json["rate"],
        both: json["both"],
        senderCurrency: json["senderCurrency"],
        receiverCurrency: json["receiverCurrency"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "symbol": symbol,
        "rate": rate,
        "both": both,
        "senderCurrency": senderCurrency,
        "receiverCurrency": receiverCurrency,
      };
}

class BasicSettings {
  int id;
  String siteName;
  String siteTitle;
  String timezone;
  String siteLogo;
  String siteLogoDark;
  String siteFav;
  String siteFavDark;
  int emailVerification;
  int agreePolicy;
  String baseColor;
  int userRegistration;
  int userKycStatus;

  BasicSettings({
    required this.id,
    required this.siteName,
    required this.siteTitle,
    required this.timezone,
    required this.siteLogo,
    required this.siteLogoDark,
    required this.siteFav,
    required this.siteFavDark,
    required this.emailVerification,
    required this.agreePolicy,
    required this.baseColor,
    required this.userRegistration,
    required this.userKycStatus,
  });

  factory BasicSettings.fromJson(Map<String, dynamic> json) => BasicSettings(
        id: json["id"],
        siteName: json["site_name"],
        siteTitle: json["site_title"],
        timezone: json["timezone"],
        siteLogo: json["site_logo"],
        siteLogoDark: json["site_logo_dark"],
        siteFav: json["site_fav"],
        siteFavDark: json["site_fav_dark"],
        emailVerification: json["email_verification"],
        agreePolicy: json["agree_policy"],
        baseColor: json["base_color"],
        userRegistration: json["user_registration"],
        userKycStatus: json["user_kyc_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "site_name": siteName,
        "site_title": siteTitle,
        "timezone": timezone,
        "site_logo": siteLogo,
        "site_logo_dark": siteLogoDark,
        "site_fav": siteFav,
        "site_fav_dark": siteFavDark,
        "email_verification": emailVerification,
        "agree_policy": agreePolicy,
        "base_color": baseColor,
        "user_registration": userRegistration,
        "user_kyc_status": userKycStatus,
      };
}

class Country implements CountryDropdownModel {
  int id;
  String name;
  String mobileCode;
  String currencyName;
  String currencyCode;
  String currencySymbol;

  Country({
    required this.id,
    required this.name,
    required this.mobileCode,
    required this.currencyName,
    required this.currencyCode,
    required this.currencySymbol,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        mobileCode: json["mobile_code"],
        currencyName: json["currency_name"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile_code": mobileCode,
        "currency_name": currencyName,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
      };

  @override
  String get title => name;
}

class ImagePaths {
  String basePath;
  String pathLocation;
  String defaultImage;

  ImagePaths({
    required this.basePath,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory ImagePaths.fromJson(Map<String, dynamic> json) => ImagePaths(
        basePath: json["base_path"],
        pathLocation: json["path_location"],
        defaultImage: json["default_image"],
      );

  Map<String, dynamic> toJson() => {
        "base_path": basePath,
        "path_location": pathLocation,
        "default_image": defaultImage,
      };
}

class OnboardScreen {
  int id;
  String heading;
  String title;
  String details;
  String image;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  OnboardScreen({
    required this.id,
    required this.heading,
    required this.title,
    required this.details,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OnboardScreen.fromJson(Map<String, dynamic> json) => OnboardScreen(
        id: json["id"],
        heading: json["heading"],
        title: json["title"],
        details: json["details"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "heading": heading,
        "title": title,
        "details": details,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class SplashScreen {
  String image;
  String version;

  SplashScreen({
    required this.image,
    required this.version,
  });

  factory SplashScreen.fromJson(Map<String, dynamic> json) => SplashScreen(
        image: json["image"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "version": version,
      };
}

class WebLinks {
  String privacyPolicy;
  String aboutUs;
  String contactUs;

  WebLinks({
    required this.privacyPolicy,
    required this.aboutUs,
    required this.contactUs,
  });

  factory WebLinks.fromJson(Map<String, dynamic> json) => WebLinks(
        privacyPolicy: json["privacy-policy"],
        aboutUs: json["about-us"],
        contactUs: json["contact-us"],
      );

  Map<String, dynamic> toJson() => {
        "privacy-policy": privacyPolicy,
        "about-us": aboutUs,
        "contact-us": contactUs,
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
