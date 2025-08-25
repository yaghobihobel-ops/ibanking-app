import 'dart:convert';

TransferMoneyPreviewModel transferMoneyPreviewModelFromJson(String str) =>
    TransferMoneyPreviewModel.fromJson(json.decode(str));

String transferMoneyPreviewModelToJson(TransferMoneyPreviewModel data) =>
    json.encode(data.toJson());

class TransferMoneyPreviewModel {
  Message message;
  TransferMoneyPreviewModelData data;
  String type;

  TransferMoneyPreviewModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory TransferMoneyPreviewModel.fromJson(Map<String, dynamic> json) =>
      TransferMoneyPreviewModel(
        message: Message.fromJson(json["message"]),
        data: TransferMoneyPreviewModelData.fromJson(json["data"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
        "type": type,
      };
}

class TransferMoneyPreviewModelData {
  TempData tempData;

  TransferMoneyPreviewModelData({
    required this.tempData,
  });

  factory TransferMoneyPreviewModelData.fromJson(Map<String, dynamic> json) =>
      TransferMoneyPreviewModelData(
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
  Beneficiary beneficiary;
  Charges charges;
  dynamic remark;

  TempDataData({
    required this.beneficiary,
    required this.charges,
    required this.remark,
  });

  factory TempDataData.fromJson(Map<String, dynamic> json) => TempDataData(
        beneficiary: Beneficiary.fromJson(json["beneficiary"]),
        charges: Charges.fromJson(json["charges"]),
        remark: json["remark"],
      );

  Map<String, dynamic> toJson() => {
        "beneficiary": beneficiary.toJson(),
        "charges": charges.toJson(),
        "remark": remark,
      };
}

class Beneficiary {
  Method method;
  String beneficiarySubtype;
  String accountNumber;
  String accountHolderName;
  dynamic email;
  Bank? bank;
  Bank? branch;
  String? phone;
  String? bankId;
  String? branchId;

  Beneficiary({
    required this.method,
    required this.beneficiarySubtype,
    required this.accountNumber,
    required this.accountHolderName,
    required this.email,
    this.bank,
    this.branch,
    this.phone,
    this.bankId,
    this.branchId,
  });

  factory Beneficiary.fromJson(Map<String, dynamic> json) => Beneficiary(
        method: Method.fromJson(json["method"]),
        beneficiarySubtype: json["beneficiary_subtype"],
        accountNumber: json["account_number"],
        accountHolderName: json["account_holder_name"],
        email: json["email"],
        bank: json["bank"] != null ? Bank.fromJson(json["bank"]) : null,
        branch: json["branch"] != null ? Bank.fromJson(json["branch"]) : null,
        phone: json["phone"],
        bankId: json["bank_id"],
        branchId: json["branch_id"],
      );

  Map<String, dynamic> toJson() => {
        "method": method.toJson(),
        "beneficiary_subtype": beneficiarySubtype,
        "account_number": accountNumber,
        "account_holder_name": accountHolderName,
        "email": email,
        "bank": bank?.toJson(),
        "branch": branch?.toJson(),
        "phone": phone,
        "bank_id": bankId,
        "branch_id": branchId,
      };
}

class Bank {
  int id;
  int adminId;
  String name;
  String alias;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  String editData;
  int? bankListId;

  Bank({
    required this.id,
    required this.adminId,
    required this.name,
    required this.alias,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.editData,
    this.bankListId,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        id: json["id"],
        adminId: json["admin_id"],
        name: json["name"],
        alias: json["alias"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        editData: json["editData"],
        bankListId: json["bank_list_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin_id": adminId,
        "name": name,
        "alias": alias,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "editData": editData,
        "bank_list_id": bankListId,
      };
}

class Method {
  int id;
  String name;
  String slug;
  int lastEditBy;
  int status;
  DateTime createdAt;
  dynamic updatedAt;

  Method({
    required this.id,
    required this.name,
    required this.slug,
    required this.lastEditBy,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Method.fromJson(Map<String, dynamic> json) => Method(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        lastEditBy: json["last_edit_by"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "last_edit_by": lastEditBy,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
}

class Charges {
  int requestAmount;
  String senderCurrency;
  dynamic receiverAmount;
  String receiverCurrency;
  int receiverCurrencyId;
  double percentCharge;
  dynamic fixedCharge;
  double totalCharge;
  double senderWalletBalance;
  double payable;

  Charges({
    required this.requestAmount,
    required this.senderCurrency,
    required this.receiverAmount,
    required this.receiverCurrency,
    required this.receiverCurrencyId,
    required this.percentCharge,
    required this.fixedCharge,
    required this.totalCharge,
    required this.senderWalletBalance,
    required this.payable,
  });

  factory Charges.fromJson(Map<String, dynamic> json) => Charges(
        requestAmount: json["request_amount"],
        senderCurrency: json["sender_currency"],
        receiverAmount: json["receiver_amount"]?.toDouble() ?? 0.0,
        receiverCurrency: json["receiver_currency"],
        receiverCurrencyId: json["receiver_currency_id"],
        percentCharge: json["percent_charge"]?.toDouble(),
        fixedCharge: json["fixed_charge"]?.toDouble() ?? 0.0,
        totalCharge: json["total_charge"]?.toDouble(),
        senderWalletBalance: json["sender_wallet_balance"]?.toDouble(),
        payable: json["payable"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "request_amount": requestAmount,
        "sender_currency": senderCurrency,
        "receiver_amount": receiverAmount,
        "receiver_currency": receiverCurrency,
        "receiver_currency_id": receiverCurrencyId,
        "percent_charge": percentCharge,
        "fixed_charge": fixedCharge,
        "total_charge": totalCharge,
        "sender_wallet_balance": senderWalletBalance,
        "payable": payable,
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
