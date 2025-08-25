import 'dart:convert';

import 'package:ibanking/base/utils/basic_import.dart';

AddMoneyInfoModel addMoneyInfoModelFromJson(String str) =>
    AddMoneyInfoModel.fromJson(json.decode(str));

String addMoneyInfoModelToJson(AddMoneyInfoModel data) =>
    json.encode(data.toJson());

class AddMoneyInfoModel {
  Message message;
  Data data;
  String type;

  AddMoneyInfoModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory AddMoneyInfoModel.fromJson(Map<String, dynamic> json) =>
      AddMoneyInfoModel(
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
  List<PaymentGateway> paymentGateways;
  UserWallet userWallet;
  CurrencyImagePath currencyImagePath;

  Data({
    required this.paymentGateways,
    required this.userWallet,
    required this.currencyImagePath,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        paymentGateways: List<PaymentGateway>.from(
            json["payment_gateways"].map((x) => PaymentGateway.fromJson(x))),
        userWallet: UserWallet.fromJson(json["user_wallet"]),
        currencyImagePath:
            CurrencyImagePath.fromJson(json["currency_image_path"]),
      );

  Map<String, dynamic> toJson() => {
        "payment_gateways":
            List<dynamic>.from(paymentGateways.map((x) => x.toJson())),
        "user_wallet": userWallet.toJson(),
        "currency_image_path": currencyImagePath.toJson(),
      };
}

class CurrencyImagePath {
  String baseUrl;
  String pathLocation;
  String defaultImage;

  CurrencyImagePath({
    required this.baseUrl,
    required this.pathLocation,
    required this.defaultImage,
  });

  factory CurrencyImagePath.fromJson(Map<String, dynamic> json) =>
      CurrencyImagePath(
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
  String type;
  String name;
  bool crypto;
  dynamic desc;
  int status;
  List<Currency> currencies;

  PaymentGateway({
    required this.id,
    required this.type,
    required this.name,
    required this.crypto,
    required this.desc,
    required this.status,
    required this.currencies,
  });

  factory PaymentGateway.fromJson(Map<String, dynamic> json) => PaymentGateway(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        crypto: json["crypto"],
        desc: json["desc"],
        status: json["status"],
        currencies: List<Currency>.from(
            json["currencies"].map((x) => Currency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "crypto": crypto,
        "desc": desc,
        "status": status,
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
      };
}

class Currency implements DropdownModel {
  int id;
  int paymentGatewayId;
  String name;
  String alias;
  String currencyCode;
  dynamic currencySymbol;
  dynamic image;
  double minLimit;
  double maxLimit;
  double percentCharge;
  double fixedCharge;
  double rate;

  Currency({
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
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        paymentGatewayId: json["payment_gateway_id"],
        name: json["name"],
        alias: json["alias"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        image: json["image"],
        minLimit: double.parse(json["min_limit"].toString()),
        maxLimit: double.parse(json["max_limit"].toString()),
        percentCharge: double.parse(json["percent_charge"].toString()),
        fixedCharge: double.parse(json["fixed_charge"].toString()),
        rate: double.parse(json["rate"].toString()),
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
      };

  @override
  String get title => name;
}

class UserWallet {
  String currency;
  dynamic balance;
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
        balance: json["balance"]?.toDouble() ?? 0.0,
        name: json["name"],
        flag: json["flag"] ?? "",
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
