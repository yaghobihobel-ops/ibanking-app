import 'dart:convert';

MoneyOutSubmitModel moneyOutSubmitModelFromJson(String str) =>
    MoneyOutSubmitModel.fromJson(json.decode(str));

String moneyOutSubmitModelToJson(MoneyOutSubmitModel data) =>
    json.encode(data.toJson());

class MoneyOutSubmitModel {
  Message message;
  Data data;
  String type;

  MoneyOutSubmitModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory MoneyOutSubmitModel.fromJson(Map<String, dynamic> json) =>
      MoneyOutSubmitModel(
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
  TempData tempData;

  Data({
    required this.tempData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tempData: TempData.fromJson(json["temp_data"]),
      );

  Map<String, dynamic> toJson() => {
        "temp_data": tempData.toJson(),
      };
}

class TempData {
  String type;
  String identifier;
  int walletId;
  Charges charges;

  TempData({
    required this.type,
    required this.identifier,
    required this.walletId,
    required this.charges,
  });

  factory TempData.fromJson(Map<String, dynamic> json) => TempData(
        type: json["type"],
        identifier: json["identifier"],
        walletId: json["wallet_id"],
        charges: Charges.fromJson(json["charges"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "identifier": identifier,
        "wallet_id": walletId,
        "charges": charges.toJson(),
      };
}

class Charges {
  double exchangeRate;
  int requestAmount;
  double fixedCharge;
  double percentCharge;
  String gatewayCurrencyCode;
  int gatewayCurrencyId;
  String senderCurrencyCode;
  int senderWalletId;
  double willGet;
  String receiveCurrency;
  String senderCurrency;
  double totalCharge;
  double totalPayable;

  Charges({
    required this.exchangeRate,
    required this.requestAmount,
    required this.fixedCharge,
    required this.percentCharge,
    required this.gatewayCurrencyCode,
    required this.gatewayCurrencyId,
    required this.senderCurrencyCode,
    required this.senderWalletId,
    required this.willGet,
    required this.receiveCurrency,
    required this.senderCurrency,
    required this.totalCharge,
    required this.totalPayable,
  });

  factory Charges.fromJson(Map<String, dynamic> json) => Charges(
        exchangeRate: json["exchange_rate"]?.toDouble(),
        requestAmount: json["request_amount"],
        fixedCharge: json["fixed_charge"]?.toDouble(),
        percentCharge: json["percent_charge"]?.toDouble(),
        gatewayCurrencyCode: json["gateway_currency_code"],
        gatewayCurrencyId: json["gateway_currency_id"],
        senderCurrencyCode: json["sender_currency_code"],
        senderWalletId: json["sender_wallet_id"],
        willGet: json["will_get"]?.toDouble(),
        receiveCurrency: json["receive_currency"],
        senderCurrency: json["sender_currency"],
        totalCharge: json["total_charge"]?.toDouble(),
        totalPayable: json["total_payable"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "exchange_rate": exchangeRate,
        "request_amount": requestAmount,
        "fixed_charge": fixedCharge,
        "percent_charge": percentCharge,
        "gateway_currency_code": gatewayCurrencyCode,
        "gateway_currency_id": gatewayCurrencyId,
        "sender_currency_code": senderCurrencyCode,
        "sender_wallet_id": senderWalletId,
        "will_get": willGet,
        "receive_currency": receiveCurrency,
        "sender_currency": senderCurrency,
        "total_charge": totalCharge,
        "total_payable": totalPayable,
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
