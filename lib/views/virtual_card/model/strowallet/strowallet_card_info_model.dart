import 'dart:convert';

StrowalletCardInfoModel strowalletCardInfoModelFromJson(String str) =>
    StrowalletCardInfoModel.fromJson(json.decode(str));

String strowalletCardInfoModelToJson(StrowalletCardInfoModel data) =>
    json.encode(data.toJson());

class StrowalletCardInfoModel {
  Message message;
  StrowalletCardInfoModelData data;
  String type;

  StrowalletCardInfoModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory StrowalletCardInfoModel.fromJson(Map<String, dynamic> json) =>
      StrowalletCardInfoModel(
        message: Message.fromJson(json["message"]),
        data: StrowalletCardInfoModelData.fromJson(json["data"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
        "type": type,
      };
}

class StrowalletCardInfoModelData {
  DataData data;

  StrowalletCardInfoModelData({
    required this.data,
  });

  factory StrowalletCardInfoModelData.fromJson(Map<String, dynamic> json) =>
      StrowalletCardInfoModelData(
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataData {
  String baseCurr;
  int rate;
  bool cardCreateAction;
  bool strowalletCustomerInfo;
  CardBasicInfo cardBasicInfo;
  List<MyCard> myCards;
  // User user;
  UserWallet userWallet;
  CardCharge cardCharge;

  DataData({
    required this.baseCurr,
    required this.rate,
    required this.cardCreateAction,
    required this.strowalletCustomerInfo,
    required this.cardBasicInfo,
    required this.myCards,
    // required this.user,
    required this.userWallet,
    required this.cardCharge,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        baseCurr: json["base_curr"],
        rate: json["rate"],
        cardCreateAction: json["card_create_action"],
        strowalletCustomerInfo: json["strowallet_customer_info"],
        cardBasicInfo: CardBasicInfo.fromJson(json["card_basic_info"]),
        myCards:
            List<MyCard>.from(json["myCards"].map((x) => MyCard.fromJson(x))),
        // user: User.fromJson(json["user"]),
        userWallet: UserWallet.fromJson(json["userWallet"]),
        cardCharge: CardCharge.fromJson(json["cardCharge"]),
      );

  Map<String, dynamic> toJson() => {
        "base_curr": baseCurr,
        "rate": rate,
        "card_create_action": cardCreateAction,
        "strowallet_customer_info": strowalletCustomerInfo,
        "card_basic_info": cardBasicInfo.toJson(),
        "myCards": List<dynamic>.from(myCards.map((x) => x.toJson())),
        // "user": user.toJson(),
        "userWallet": userWallet.toJson(),
        "cardCharge": cardCharge.toJson(),
      };
}

class CardBasicInfo {
  int cardCreateLimit;
  String cardBackDetails;
  String cardBg;
  String siteTitle;
  String siteLogo;
  String siteFav;

  CardBasicInfo({
    required this.cardCreateLimit,
    required this.cardBackDetails,
    required this.cardBg,
    required this.siteTitle,
    required this.siteLogo,
    required this.siteFav,
  });

  factory CardBasicInfo.fromJson(Map<String, dynamic> json) => CardBasicInfo(
        cardCreateLimit: json["card_create_limit"],
        cardBackDetails: json["card_back_details"],
        cardBg: json["card_bg"],
        siteTitle: json["site_title"],
        siteLogo: json["site_logo"],
        siteFav: json["site_fav"],
      );

  Map<String, dynamic> toJson() => {
        "card_create_limit": cardCreateLimit,
        "card_back_details": cardBackDetails,
        "card_bg": cardBg,
        "site_title": siteTitle,
        "site_logo": siteLogo,
        "site_fav": siteFav,
      };
}

class CardCharge {
  int id;
  String slug;
  String title;
  int fixedCharge;
  int percentCharge;
  int minLimit;
  int maxLimit;

  CardCharge({
    required this.id,
    required this.slug,
    required this.title,
    required this.fixedCharge,
    required this.percentCharge,
    required this.minLimit,
    required this.maxLimit,
  });

  factory CardCharge.fromJson(Map<String, dynamic> json) => CardCharge(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        fixedCharge: json["fixed_charge"],
        percentCharge: json["percent_charge"],
        minLimit: json["min_limit"],
        maxLimit: json["max_limit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "fixed_charge": fixedCharge,
        "percent_charge": percentCharge,
        "min_limit": minLimit,
        "max_limit": maxLimit,
      };
}

class MyCard {
  int id;
  String name;
  String cardNumber;
  String cardId;
  String expiry;
  String cvv;
  String cardStatus;
  int balance;
  String cardBackDetails;
  String siteTitle;
  String siteLogo;
  String siteFav;
  bool status;
  bool isDefault;
  StatusInfo statusInfo;

  MyCard({
    required this.id,
    required this.name,
    required this.cardNumber,
    required this.cardId,
    required this.expiry,
    required this.cvv,
    required this.cardStatus,
    required this.balance,
    required this.cardBackDetails,
    required this.siteTitle,
    required this.siteLogo,
    required this.siteFav,
    required this.status,
    required this.isDefault,
    required this.statusInfo,
  });

  factory MyCard.fromJson(Map<String, dynamic> json) => MyCard(
        id: json["id"],
        name: json["name"],
        cardNumber: json["card_number"],
        cardId: json["card_id"],
        expiry: json["expiry"],
        cvv: json["cvv"],
        cardStatus: json["card_status"],
        balance: json["balance"],
        cardBackDetails: json["card_back_details"],
        siteTitle: json["site_title"],
        siteLogo: json["site_logo"],
        siteFav: json["site_fav"],
        status: json["status"],
        isDefault: json["is_default"],
        statusInfo: StatusInfo.fromJson(json["status_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "card_number": cardNumber,
        "card_id": cardId,
        "expiry": expiry,
        "cvv": cvv,
        "card_status": cardStatus,
        "balance": balance,
        "card_back_details": cardBackDetails,
        "site_title": siteTitle,
        "site_logo": siteLogo,
        "site_fav": siteFav,
        "status": status,
        "is_default": isDefault,
        "status_info": statusInfo.toJson(),
      };
}

class StatusInfo {
  int block;
  int unblock;

  StatusInfo({
    required this.block,
    required this.unblock,
  });

  factory StatusInfo.fromJson(Map<String, dynamic> json) => StatusInfo(
        block: json["block"],
        unblock: json["unblock"],
      );

  Map<String, dynamic> toJson() => {
        "block": block,
        "unblock": unblock,
      };
}

class User {
  int id;
  String firstname;
  String lastname;
  String username;
  String email;
  String mobileCode;
  String mobile;
  String fullMobile;
  String accountNo;
  int pinStatus;
  String pinCode;
  String accountType;
  dynamic companyName;
  String gender;
  dynamic referralId;
  dynamic image;
  int status;
  Address address;
  int emailVerified;
  int smsVerified;
  int kycVerified;
  dynamic verCode;
  dynamic verCodeSendAt;
  int twoFactorVerified;
  int twoFactorStatus;
  dynamic twoFactorSecret;
  dynamic emailVerifiedAt;
  dynamic strowalletCustomer;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String fullname;
  String userImage;
  String lastLogin;
  StringStatus kycStringStatus;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.mobileCode,
    required this.mobile,
    required this.fullMobile,
    required this.accountNo,
    required this.pinStatus,
    required this.pinCode,
    required this.accountType,
    this.companyName,
    required this.gender,
    required this.referralId,
    this.image,
    required this.status,
    required this.address,
    required this.emailVerified,
    required this.smsVerified,
    required this.kycVerified,
    required this.verCode,
    required this.verCodeSendAt,
    required this.twoFactorVerified,
    required this.twoFactorStatus,
    this.twoFactorSecret,
    required this.emailVerifiedAt,
    this.strowalletCustomer,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.fullname,
    required this.userImage,
    required this.lastLogin,
    required this.kycStringStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
        email: json["email"],
        mobileCode: json["mobile_code"],
        mobile: json["mobile"],
        fullMobile: json["full_mobile"],
        accountNo: json["account_no"],
        pinStatus: json["pin_status"],
        pinCode: json["pin_code"],
        accountType: json["account_type"],
        companyName: json["company_name"] ?? '',
        gender: json["gender"],
        referralId: json["referral_id"],
        image: json["image"] ?? "",
        status: json["status"],
        address: Address.fromJson(json["address"]),
        emailVerified: json["email_verified"],
        smsVerified: json["sms_verified"],
        kycVerified: json["kyc_verified"],
        verCode: json["ver_code"],
        verCodeSendAt: json["ver_code_send_at"],
        twoFactorVerified: json["two_factor_verified"],
        twoFactorStatus: json["two_factor_status"],
        twoFactorSecret: json["two_factor_secret"] ?? "",
        emailVerifiedAt: json["email_verified_at"],
        strowalletCustomer:
            StrowalletCustomer.fromJson(json["strowallet_customer"] ?? {}),
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        fullname: json["fullname"],
        userImage: json["userImage"],
        lastLogin: json["lastLogin"],
        kycStringStatus: StringStatus.fromJson(json["kycStringStatus"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "mobile_code": mobileCode,
        "mobile": mobile,
        "full_mobile": fullMobile,
        "account_no": accountNo,
        "pin_status": pinStatus,
        "pin_code": pinCode,
        "account_type": accountType,
        "company_name": companyName,
        "gender": gender,
        "referral_id": referralId,
        "image": image,
        "status": status,
        "address": address.toJson(),
        "email_verified": emailVerified,
        "sms_verified": smsVerified,
        "kyc_verified": kycVerified,
        "ver_code": verCode,
        "ver_code_send_at": verCodeSendAt,
        "two_factor_verified": twoFactorVerified,
        "two_factor_status": twoFactorStatus,
        "two_factor_secret": twoFactorSecret,
        "email_verified_at": emailVerifiedAt,
        "strowallet_customer": strowalletCustomer.toJson(),
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "fullname": fullname,
        "userImage": userImage,
        "lastLogin": lastLogin,
        "kycStringStatus": kycStringStatus.toJson(),
      };
}

class Address {
  String country;
  String state;
  String city;
  String zip;
  String address;

  Address({
    required this.country,
    required this.state,
    required this.city,
    required this.zip,
    required this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        country: json["country"],
        state: json["state"],
        city: json["city"],
        zip: json["zip"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "state": state,
        "city": city,
        "zip": zip,
        "address": address,
      };
}

class StringStatus {
  String stringStatusClass;
  String value;

  StringStatus({
    required this.stringStatusClass,
    required this.value,
  });

  factory StringStatus.fromJson(Map<String, dynamic> json) => StringStatus(
        stringStatusClass: json["class"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "class": stringStatusClass,
        "value": value,
      };
}

class StrowalletCustomer {
  String? customerEmail;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? city;
  String? state;
  String? country;
  String? line1;
  String? zipCode;
  String? houseNumber;
  String? idNumber;
  String? idType;
  String? idImage;
  String? userPhoto;
  String? customerId;
  DateTime? dateOfBirth;
  String? status;

  StrowalletCustomer({
    this.customerEmail,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.city,
    this.state,
    this.country,
    this.line1,
    this.zipCode,
    this.houseNumber,
    this.idNumber,
    this.idType,
    this.idImage,
    this.userPhoto,
    this.customerId,
    this.dateOfBirth,
    this.status,
  });

  factory StrowalletCustomer.fromJson(Map<String, dynamic> json) =>
      StrowalletCustomer(
        customerEmail: json["customerEmail"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        line1: json["line1"],
        zipCode: json["zipCode"],
        houseNumber: json["houseNumber"],
        idNumber: json["idNumber"],
        idType: json["idType"],
        idImage: json["idImage"],
        userPhoto: json["userPhoto"],
        customerId: json["customerId"],
        dateOfBirth: json["dateOfBirth"] != null
            ? DateTime.tryParse(json["dateOfBirth"])
            : null,
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "customerEmail": customerEmail,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "city": city,
        "state": state,
        "country": country,
        "line1": line1,
        "zipCode": zipCode,
        "houseNumber": houseNumber,
        "idNumber": idNumber,
        "idType": idType,
        "idImage": idImage,
        "userPhoto": userPhoto,
        "customerId": customerId,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "status": status,
      };
}

class UserWallet {
  double balance;
  String currency;

  UserWallet({
    required this.balance,
    required this.currency,
  });

  factory UserWallet.fromJson(Map<String, dynamic> json) => UserWallet(
        balance: json["balance"]?.toDouble(),
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "currency": currency,
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
