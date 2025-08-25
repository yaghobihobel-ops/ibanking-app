import 'dart:convert';

InstructionConfirmModel instructionConfirmModelFromJson(String str) =>
    InstructionConfirmModel.fromJson(json.decode(str));

String instructionConfirmModelToJson(InstructionConfirmModel data) =>
    json.encode(data.toJson());

class InstructionConfirmModel {
  Message message;
  InstructionConfirmModelData data;
  String type;

  InstructionConfirmModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory InstructionConfirmModel.fromJson(Map<String, dynamic> json) =>
      InstructionConfirmModel(
        message: Message.fromJson(json["message"]),
        data: InstructionConfirmModelData.fromJson(json["data"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
        "type": type,
      };
}

class InstructionConfirmModelData {
  TempData tempData;

  InstructionConfirmModelData({
    required this.tempData,
  });

  factory InstructionConfirmModelData.fromJson(Map<String, dynamic> json) =>
      InstructionConfirmModelData(
        tempData: TempData.fromJson(json["temp_data"]),
      );

  Map<String, dynamic> toJson() => {
        "temp_data": tempData.toJson(),
      };
}

class TempData {
  int id;
  String type;
  String identifier;
  dynamic gatewayCode;
  dynamic currencyCode;
  TempDataData data;
  DateTime createdAt;
  DateTime updatedAt;

  TempData({
    required this.id,
    required this.type,
    required this.identifier,
    required this.gatewayCode,
    required this.currencyCode,
    required this.data,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TempData.fromJson(Map<String, dynamic> json) => TempData(
        id: json["id"],
        type: json["type"],
        identifier: json["identifier"],
        gatewayCode: json["gateway_code"],
        currencyCode: json["currency_code"],
        data: TempDataData.fromJson(json["data"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "identifier": identifier,
        "gateway_code": gatewayCode,
        "currency_code": currencyCode,
        "data": data.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class TempDataData {
  int gatewayCurrencyId;
  int walletId;
  Charges charges;
  GetValues getValues;

  TempDataData({
    required this.gatewayCurrencyId,
    required this.walletId,
    required this.charges,
    required this.getValues,
  });

  factory TempDataData.fromJson(Map<String, dynamic> json) => TempDataData(
        gatewayCurrencyId: json["gateway_currency_id"],
        walletId: json["wallet_id"],
        charges: Charges.fromJson(json["charges"]),
        getValues: GetValues.fromJson(json["get_values"]),
      );

  Map<String, dynamic> toJson() => {
        "gateway_currency_id": gatewayCurrencyId,
        "wallet_id": walletId,
        "charges": charges.toJson(),
        "get_values": getValues.toJson(),
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

class GetValues {
  The1 the1;

  GetValues({
    required this.the1,
  });

  factory GetValues.fromJson(Map<String, dynamic> json) => GetValues(
        the1: The1.fromJson(json["1"]),
      );

  Map<String, dynamic> toJson() => {
        "1": the1.toJson(),
      };
}

class The1 {
  String type;
  String label;
  String name;
  bool required;
  Validation validation;
  String value;

  The1({
    required this.type,
    required this.label,
    required this.name,
    required this.required,
    required this.validation,
    required this.value,
  });

  factory The1.fromJson(Map<String, dynamic> json) => The1(
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
  String max;
  List<dynamic> mimes;
  String min;
  List<dynamic> options;
  bool required;

  Validation({
    required this.max,
    required this.mimes,
    required this.min,
    required this.options,
    required this.required,
  });

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
        max: json["max"],
        mimes: List<dynamic>.from(json["mimes"].map((x) => x)),
        min: json["min"],
        options: List<dynamic>.from(json["options"].map((x) => x)),
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
