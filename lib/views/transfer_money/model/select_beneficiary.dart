// To parse this JSON data, do
//
//     final selectBeneficiaryModel = selectBeneficiaryModelFromJson(jsonString);

import 'dart:convert';

SelectBeneficiaryModel selectBeneficiaryModelFromJson(String str) =>
    SelectBeneficiaryModel.fromJson(json.decode(str));

String selectBeneficiaryModelToJson(SelectBeneficiaryModel data) =>
    json.encode(data.toJson());

class SelectBeneficiaryModel {
  Message message;
  SelectBeneficiaryModelData data;
  String type;

  SelectBeneficiaryModel({
    required this.message,
    required this.data,
    required this.type,
  });

  factory SelectBeneficiaryModel.fromJson(Map<String, dynamic> json) =>
      SelectBeneficiaryModel(
        message: Message.fromJson(json["message"]),
        data: SelectBeneficiaryModelData.fromJson(json["data"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
        "data": data.toJson(),
        "type": type,
      };
}

class SelectBeneficiaryModelData {
  TempData tempData;

  SelectBeneficiaryModelData({
    required this.tempData,
  });

  factory SelectBeneficiaryModelData.fromJson(Map<String, dynamic> json) =>
      SelectBeneficiaryModelData(
        tempData: TempData.fromJson(json["temp_data"]),
      );

  Map<String, dynamic> toJson() => {
        "temp_data": tempData.toJson(),
      };
}

class TempData {
  String type;
  String identifier;
  TempDataData data;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  TempData({
    required this.type,
    required this.identifier,
    required this.data,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory TempData.fromJson(Map<String, dynamic> json) => TempData(
        type: json["type"],
        identifier: json["identifier"],
        data: TempDataData.fromJson(json["data"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "identifier": identifier,
        "data": data.toJson(),
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}

class TempDataData {
  Beneficiary beneficiary;

  TempDataData({
    required this.beneficiary,
  });

  factory TempDataData.fromJson(Map<String, dynamic> json) => TempDataData(
        beneficiary: Beneficiary.fromJson(json["beneficiary"]),
      );

  Map<String, dynamic> toJson() => {
        "beneficiary": beneficiary.toJson(),
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
        phone: json["phone"] ?? '',
        bankId: json["bank_id"] ?? '',
        branchId: json["branch_id"] ?? '',
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
