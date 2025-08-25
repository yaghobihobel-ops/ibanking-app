import 'dart:convert';

StrowalletCardDetailsModel strowalletCardDetailsModelFromJson(String str) =>
    StrowalletCardDetailsModel.fromJson(json.decode(str));

String strowalletCardDetailsModelToJson(StrowalletCardDetailsModel data) =>
    json.encode(data.toJson());

class StrowalletCardDetailsModel {
  Message message;
  StrowalletCardDetailsModelData data;
  String type;

  StrowalletCardDetailsModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory StrowalletCardDetailsModel.fromJson(Map<String, dynamic> json) =>
      StrowalletCardDetailsModel(
        message: Message.fromJson(json["message"]),
        data: StrowalletCardDetailsModelData.fromJson(json["data"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
        "type": type,
      };
}

class StrowalletCardDetailsModelData {
  DataData data;

  StrowalletCardDetailsModelData({
    required this.data,
  });

  factory StrowalletCardDetailsModelData.fromJson(Map<String, dynamic> json) =>
      StrowalletCardDetailsModelData(
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataData {
  String baseCurr;
  List<MyCard> myCards;
  List<BusinessAddress> businessAddress;

  DataData({
    required this.baseCurr,
    required this.myCards,
    required this.businessAddress,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        baseCurr: json["base_curr"],
        myCards:
            List<MyCard>.from(json["myCards"].map((x) => MyCard.fromJson(x))),
        businessAddress: List<BusinessAddress>.from(
            json["business_address"].map((x) => BusinessAddress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_curr": baseCurr,
        "myCards": List<dynamic>.from(myCards.map((x) => x.toJson())),
        "business_address":
            List<dynamic>.from(businessAddress.map((x) => x.toJson())),
      };
}

class BusinessAddress {
  int id;
  String labelName;
  String value;

  BusinessAddress({
    required this.id,
    required this.labelName,
    required this.value,
  });

  factory BusinessAddress.fromJson(Map<String, dynamic> json) =>
      BusinessAddress(
        id: json["id"],
        labelName: json["label_name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label_name": labelName,
        "value": value,
      };
}

class MyCard {
  int id;
  String name;
  String cardId;
  String cardNumber;
  String cardBrand;
  String cardUserId;
  String expiry;
  String cvv;
  String cardType;
  String city;
  String state;
  String zipCode;
  dynamic amount;
  String cardBackDetails;
  String cardBg;
  String siteTitle;
  String siteLogo;
  bool status;
  bool isDefault;

  MyCard({
    required this.id,
    required this.name,
    required this.cardId,
    required this.cardNumber,
    required this.cardBrand,
    required this.cardUserId,
    required this.expiry,
    required this.cvv,
    required this.cardType,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.amount,
    required this.cardBackDetails,
    required this.cardBg,
    required this.siteTitle,
    required this.siteLogo,
    required this.status,
    required this.isDefault,
  });

  factory MyCard.fromJson(Map<String, dynamic> json) => MyCard(
        id: json["id"],
        name: json["name"],
        cardId: json["card_id"],
        cardNumber: json["card_number"],
        cardBrand: json["card_brand"],
        cardUserId: json["card_user_id"],
        expiry: json["expiry"],
        cvv: json["cvv"],
        cardType: json["card_type"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        amount: json["amount"]?.toDouble() ?? 0.0,
        cardBackDetails: json["card_back_details"],
        cardBg: json["card_bg"],
        siteTitle: json["site_title"],
        siteLogo: json["site_logo"],
        status: json["status"],
        isDefault: json["is_default"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "card_id": cardId,
        "card_number": cardNumber,
        "card_brand": cardBrand,
        "card_user_id": cardUserId,
        "expiry": expiry,
        "cvv": cvv,
        "card_type": cardType,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "amount": amount,
        "card_back_details": cardBackDetails,
        "card_bg": cardBg,
        "site_title": siteTitle,
        "site_logo": siteLogo,
        "status": status,
        "is_default": isDefault,
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
