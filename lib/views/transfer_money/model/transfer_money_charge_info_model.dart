import 'dart:convert';

TransferMoneyChargeInfoModel transferMoneyChargeInfoModelFromJson(String str) =>
    TransferMoneyChargeInfoModel.fromJson(json.decode(str));

String transferMoneyChargeInfoModelToJson(TransferMoneyChargeInfoModel data) =>
    json.encode(data.toJson());

class TransferMoneyChargeInfoModel {
  Message message;
  Data data;
  String type;

  TransferMoneyChargeInfoModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory TransferMoneyChargeInfoModel.fromJson(Map<String, dynamic> json) =>
      TransferMoneyChargeInfoModel(
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
  FeesAndCharges feesAndCharges;

  Data({
    required this.feesAndCharges,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        feesAndCharges: FeesAndCharges.fromJson(json["fees_and_charges"]),
      );

  Map<String, dynamic> toJson() => {
        "fees_and_charges": feesAndCharges.toJson(),
      };
}

class FeesAndCharges {
  String currency;
  dynamic rate;
  String slug;
  String title;
  dynamic fixedCharge;
  dynamic percentCharge;
  dynamic minLimit;
  dynamic maxLimit;
  dynamic monthlyLimit;
  dynamic dailyLimit;

  FeesAndCharges({
    required this.currency,
    this.rate,
    required this.slug,
    required this.title,
    this.fixedCharge,
    this.percentCharge,
    this.minLimit,
    this.maxLimit,
    this.monthlyLimit,
    this.dailyLimit,
  });

  factory FeesAndCharges.fromJson(Map<String, dynamic> json) => FeesAndCharges(
        currency: json["currency"],
        rate: json["rate"]?.toDouble() ?? 0.0,
        slug: json["slug"],
        title: json["title"],
        fixedCharge: json["fixed_charge"]?.toDouble() ?? 0.0,
        percentCharge: json["percent_charge"]?.toDouble() ?? 0.0,
        minLimit: json["min_limit"]?.toDouble() ?? 0.0,
        maxLimit: json["max_limit"]?.toDouble() ?? 0.0,
        monthlyLimit: json["monthly_limit"]?.toDouble() ?? 0.0,
        dailyLimit: json["daily_limit"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "rate": rate,
        "slug": slug,
        "title": title,
        "fixed_charge": fixedCharge,
        "percent_charge": percentCharge,
        "min_limit": minLimit,
        "max_limit": maxLimit,
        "monthly_limit": monthlyLimit,
        "daily_limit": dailyLimit,
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
