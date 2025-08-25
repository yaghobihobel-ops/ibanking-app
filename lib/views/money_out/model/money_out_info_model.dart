import 'dart:convert';

import 'package:ibanking/base/utils/basic_import.dart';

MoneyOutInfo moneyOutInfoFromJson(String str) =>
    MoneyOutInfo.fromJson(json.decode(str));

String moneyOutInfoToJson(MoneyOutInfo data) => json.encode(data.toJson());

class MoneyOutInfo {
  Message message;
  Data data;
  String type;

  MoneyOutInfo({
    required this.message,
    required this.data,
    required this.type,
  });

  factory MoneyOutInfo.fromJson(Map<String, dynamic> json) => MoneyOutInfo(
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
  UserWallet userWallet;
  ImagePath imagePath;
  List<PaymentGateway> paymentGateways;

  Data({
    required this.userWallet,
    required this.imagePath,
    required this.paymentGateways,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userWallet: UserWallet.fromJson(json["user_wallet"]),
        imagePath: ImagePath.fromJson(json["image_path"]),
        paymentGateways: List<PaymentGateway>.from(
            json["payment_gateways"].map((x) => PaymentGateway.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_wallet": userWallet.toJson(),
        "image_path": imagePath.toJson(),
        "payment_gateways":
            List<dynamic>.from(paymentGateways.map((x) => x.toJson())),
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

class PaymentGateway implements DropdownModel {
  String name;
  String alias;
  dynamic minLimit;
  dynamic maxLimit;
  dynamic fixedCharge;
  dynamic percentCharge;
  double rate;
  String gatewayCurrency;

  PaymentGateway({
    required this.name,
    required this.alias,
    required this.minLimit,
    required this.maxLimit,
    required this.fixedCharge,
    required this.percentCharge,
    required this.rate,
    required this.gatewayCurrency,
  });

  factory PaymentGateway.fromJson(Map<String, dynamic> json) => PaymentGateway(
        name: json["name"],
        alias: json["alias"],
        minLimit: json["min_limit"]?.toDouble() ?? 0.0,
        maxLimit: json["max_limit"]?.toDouble() ?? 0.0,
        fixedCharge: json["fixed_charge"]?.toDouble() ?? 0.0,
        percentCharge: json["percent_charge"]?.toDouble() ?? 0.0,
        rate: json["rate"]?.toDouble() ?? 0.0,
        gatewayCurrency: json["gateway_currency"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "alias": alias,
        "min_limit": minLimit,
        "max_limit": maxLimit,
        "fixed_charge": fixedCharge,
        "percent_charge": percentCharge,
        "rate": rate,
        "gateway_currency": gatewayCurrency,
      };

  @override
  String get title => name;
}

class UserWallet {
  String currency;
  double balance;
  String name;
  String flag;
  dynamic rate;

  UserWallet({
    required this.currency,
    required this.balance,
    required this.name,
    required this.flag,
    required this.rate,
  });

  factory UserWallet.fromJson(Map<String, dynamic> json) => UserWallet(
        currency: json["currency"],
        balance: json["balance"]?.toDouble(),
        name: json["name"],
        flag: json["flag"],
        rate: json["rate"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "balance": balance,
        "name": name,
        "flag": flag,
        "rate": rate,
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
