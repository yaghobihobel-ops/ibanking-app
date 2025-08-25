import '../../../../base/widgets/country_drop_down.dart';

class ProfileInfoModel {
  final Message message;
  final Data data;
  final String type;

  ProfileInfoModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) =>
      ProfileInfoModel(
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
  final Instructions instructions;
  final UserInfo userInfo;
  final ImagePaths imagePaths;
  final List<Country> countries;
  final ImagePaths kycImagePaths;

  Data({
    required this.instructions,
    required this.userInfo,
    required this.imagePaths,
    required this.countries,
    required this.kycImagePaths,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        instructions: Instructions.fromJson(json["instructions"]),
        userInfo: UserInfo.fromJson(json["user_info"]),
        imagePaths: ImagePaths.fromJson(json["image_paths"]),
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
        kycImagePaths: ImagePaths.fromJson(json["kyc_image_paths"]),
      );

  Map<String, dynamic> toJson() => {
        "instructions": instructions.toJson(),
        "user_info": userInfo.toJson(),
        "image_paths": imagePaths.toJson(),
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "kyc_image_paths": kycImagePaths.toJson(),
      };
}

class Country implements CountryDropdownModel {
  final int id;
  final String name;
  final String mobileCode;
  final String currencyName;
  final String currencyCode;
  final String currencySymbol;

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
  final String baseUrl;
  final String pathLocation;
  final String defaultImage;

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

class Instructions {
  final String kycVerified;

  Instructions({
    required this.kycVerified,
  });

  factory Instructions.fromJson(Map<String, dynamic> json) => Instructions(
        kycVerified: json["kyc_verified"],
      );

  Map<String, dynamic> toJson() => {
        "kyc_verified": kycVerified,
      };
}

class UserInfo {
  final int id;
  final String firstname;
  final String lastname;
  final String gender;
  final dynamic birthdate;
  final String username;
  final String email;
  final dynamic mobileCode;
  final dynamic mobile;
  final dynamic image;
  final int kycVerified;
  final String accountNumber;

  final Address address;
  final Kyc kyc;

  UserInfo({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.gender,
    required this.birthdate,
    required this.username,
    required this.email,
    required this.mobileCode,
    this.mobile,
    this.image,
    required this.kycVerified,
    required this.accountNumber,
    required this.address,
    required this.kyc,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json["id"],
      firstname: json["first_name"],
      lastname: json["last_name"],
      gender: json["gender"],
      birthdate: DateTime.parse(json["birthdate"] == ''
          ? DateTime.now().toString()
          : json["birthdate"]),
      username: json["username"],
      email: json["email"],
      mobileCode: json["mobile_code"],
      mobile: json["mobile"] ?? '',
      image: json["image"] ?? '',
      kycVerified: json["kyc_verified"],
      address: Address.fromJson(json["address"]),
      kyc: Kyc.fromJson(json["kyc"]),
      accountNumber: json["account_no"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "birthdate": birthdate,
        "username": username,
        "email": email,
        "mobile_code": mobileCode,
        "mobile": mobile,
        "image": image,
        "kyc_verified": kycVerified,
        "address": address.toJson(),
        "kyc": kyc.toJson(),
        "account_no": accountNumber,
      };
}

class Kyc {
  final List<Datum> data;
  final String rejectReason;

  Kyc({
    required this.data,
    required this.rejectReason,
  });

  factory Kyc.fromJson(Map<String, dynamic> json) => Kyc(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        rejectReason: json["reject_reason"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "reject_reason": rejectReason,
      };
}

class Datum {
  final String type;
  final String label;
  final String name;
  final bool required;
  final Validation validation;
  final String value;

  Datum({
    required this.type,
    required this.label,
    required this.name,
    required this.required,
    required this.validation,
    required this.value,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        label: json["label"],
        name: json["name"],
        required: json["required"],
        validation: Validation.fromJson(json["validation"]),
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "label": label,
        "name": name,
        "required": required,
        "validation": validation.toJson(),
        "value": value,
      };
}

class Validation {
  final dynamic max;
  final List<String> mimes;
  final dynamic min;
  final List<String> options;
  final bool required;

  Validation({
    required this.max,
    required this.mimes,
    required this.min,
    required this.options,
    required this.required,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        max: json["max"],
        mimes: List<String>.from(json["mimes"].map((x) => x)),
        min: json["min"],
        options: List<String>.from(json["options"].map((x) => x)),
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "mimes": List<dynamic>.from(mimes.map((x) => x)),
        "min": min,
        "options": List<dynamic>.from(options.map((x) => x)),
        "required": required,
      };
}

class Message {
  final List<String> success;

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

class Address {
  String country;
  String city;
  String state;
  String zip;
  String address;

  Address({
    required this.country,
    required this.city,
    required this.state,
    required this.zip,
    required this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        country: json["country"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "city": city,
        "state": state,
        "zip": zip,
        "address": address,
      };
}
